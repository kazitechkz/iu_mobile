import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/helpers/mathjax_helper.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/check_sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/sub_step_detail_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/widgets/get_sub_step_content.dart';
import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/services/injection_main.container.dart';

class SubStepDetailScreen extends StatefulWidget {
  final String subStepID;

  const SubStepDetailScreen({super.key, required this.subStepID});


  @override
  State<SubStepDetailScreen> createState() => _SubStepDetailState();
}

class _SubStepDetailState extends State<SubStepDetailScreen> {

  @override
  void initState() {
    super.initState();
    final SubStepExamParameters parameters = SubStepExamParameters(
        subStepId: widget.subStepID, localeId: '1');
    sl<SubStepDetailBloc>().addEvent(GetSubStepDetailEvent(widget.subStepID));
    sl<CheckSubStepExamResultBloc>().add(CheckExamResultEvent(parameters));
  }

  @override
  void didUpdateWidget(covariant SubStepDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.subStepID != oldWidget.subStepID) {
      sl<SubStepDetailBloc>().addEvent(GetSubStepDetailEvent(widget.subStepID));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubStepDetailBloc, SubStepDetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is SubStepDetailLoading) {
          return const Center(
            child: GFLoader(type: GFLoaderType.ios),
          );
        } else if (state is SubStepDetailLoaded) {
          return Scaffold(
            appBar: GFAppBar(
              leading: GFIconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  // context.goNamed(RouteConstant.stepsScreenName);
                  context.goNamed(RouteConstant.stepDetailScreenName,
                      pathParameters: {'subjectID': state.entity.step.subject_id
                          .toString()});
                },
                type: GFButtonType.transparent,
              ),
              title: Text(state.entity.titleKk),
              centerTitle: true,
            ),
            body: getSubStepContent(state),
          );
        } else if (state is SubStepDetailErrorState) {
          return Text('Ошибка: ${state.failureData.message}');
        } else {
          return const Center(child: Text('Непредвиденное состояние блока'));
        }
      },
    );
  }
}

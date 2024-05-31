import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/check_sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/sub_step_detail_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/widgets/get_sub_step_content.dart';
import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/services/injection_main.container.dart';
import '../../../../../core/widgets/common_app_bar_widget.dart';

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
        if (state is SubStepDetailErrorState) {
          sl<SubStepDetailBloc>().addEvent(GetSubStepDetailEvent(widget.subStepID));
        }
      },
      builder: (context, state) {
        if (state is SubStepDetailLoading) {
          return const Center(
            child: GFLoader(type: GFLoaderType.ios),
          );
        } else if (state is SubStepDetailLoaded) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CommonAppBarWidget(text: state.entity.titleKk, imageUrl: 'assets/images/icons/education.webp', routeLink: RouteConstant.stepDetailScreenName, pathParams: {'subjectID': state.entity.step.subject_id
                .toString()}),
            body: getSubStepContent(state, context),
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

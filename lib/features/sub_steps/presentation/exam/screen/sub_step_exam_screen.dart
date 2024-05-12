import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/components/radio_list_tile/gf_radio_list_tile.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/radio_bloc/exam_radio_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/sub_step_exam_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/widgets/sub_step_exam_widget.dart';

import '../../../../../core/app_constants/route_constant.dart';

class SubStepExamScreen extends StatefulWidget {
  final SubStepExamParameters params;

  const SubStepExamScreen({super.key, required this.params});

  @override
  State<SubStepExamScreen> createState() => _SubStepExamScreenState();
}

class _SubStepExamScreenState extends State<SubStepExamScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SubStepExamBloc>().add(GetExamTestsEvent(widget.params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubStepExamBloc, SubStepExamState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is SubStepExamLoaded) {
          return Scaffold(
            appBar: GFAppBar(
              leading: GFIconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  // context.goNamed(RouteConstant.stepsScreenName);
                  context.goNamed(RouteConstant.subStepDetailScreenName,
                      pathParameters: {'subStepID': state.subStepExams[0].sub_step_id
                          .toString()});
                },
                type: GFButtonType.transparent,
              ),
              title: Text('Контрольные вопросы'),
              centerTitle: true,
            ),
            body: getSubStepExamTests(state.subStepExams),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.read<ExamRadioBloc>().add(SubmitAnswers()),
              child: const Icon(Icons.send),
            ),
          );
        }
        return const Center(
          child: GFLoader(type: GFLoaderType.ios),
        );
      },
    );
  }
}

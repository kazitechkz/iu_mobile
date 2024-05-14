import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';
import 'package:iu/features/sub_steps/presentation/result/bloc/sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/result/widgets/getSubStepExamResultContent.dart';

import '../../../../../core/app_constants/route_constant.dart';

class SubStepExamResultScreen extends StatefulWidget {
  final SubStepExamParameters params;
  const SubStepExamResultScreen({super.key, required this.params});

  @override
  State<SubStepExamResultScreen> createState() => _SubStepExamResultScreenState();
}

class _SubStepExamResultScreenState extends State<SubStepExamResultScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SubStepExamResultBloc>().add(GetSubStepExamResultEvent(widget.params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubStepExamResultBloc, SubStepExamResultState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is SubStepExamResultLoaded) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: GFAppBar(
              leading: GFIconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.goNamed(RouteConstant.subStepDetailScreenName,
                      pathParameters: {'subStepID': state.subStepExamResults.subStepExamEntity[0].sub_step_id
                          .toString()});
                },
                type: GFButtonType.transparent,
              ),
              title: Text('Контрольные вопросы'),
              centerTitle: true,
            ),
            body: getSubStepExamResultContent(state.subStepExamResults, context),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () => context.read<ExamRadioBloc>().add(SubmitAnswers()),
            //   child: const Icon(Icons.send),
            // ),
          );
        }
        return const Center(
          child: GFLoader(type: GFLoaderType.ios),
        );
      },
    );
  }
}

import '../../../../core/utils/typedef.dart';

class PassSubStepExamParams {
  final String answer;
  final int localeId;
  final int subStepTestId;

  const PassSubStepExamParams({required this.answer, required this.localeId, required this.subStepTestId});

  DataMap toJson() {
    return {
      'answer': answer,
      'locale_id': localeId,
      'sub_step_test_id': subStepTestId
    };
  }
}
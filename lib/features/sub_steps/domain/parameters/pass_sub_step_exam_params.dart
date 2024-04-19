import '../../../../core/utils/typedef.dart';

class PassSubStepExamParams {
  final String answer;
  final int locale_id;
  final int sub_step_test_id;

  const PassSubStepExamParams({required this.answer, required this.locale_id, required this.sub_step_test_id});

  DataMap toJson() {
    return {
      'answer': answer,
      'locale_id': locale_id,
      'sub_step_test_id': sub_step_test_id
    };
  }
}
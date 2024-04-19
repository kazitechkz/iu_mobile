import 'package:iu/core/utils/typedef.dart';

class SubStepExamParameters {
  final int sub_step_id;
  final int locale_id;

  const SubStepExamParameters({required this.sub_step_id, required this.locale_id});

  DataMap toJson() {
    return {
      'sub_step_id': sub_step_id,
      'locale_id': locale_id
    };
  }
}
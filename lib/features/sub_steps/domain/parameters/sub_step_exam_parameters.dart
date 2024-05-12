import 'package:iu/core/utils/typedef.dart';

class SubStepExamParameters {
  final String subStepId;
  final String localeId;

  const SubStepExamParameters({required this.subStepId, required this.localeId});

  DataMap toJson() {
    return {
      'sub_step_id': subStepId,
      'locale_id': localeId
    };
  }
}
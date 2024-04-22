import 'package:iu/core/utils/typedef.dart';

class CreateAttemptUntSettingParams {
  final String settings;
  final int localeId;
  final int subjectId;
  final int time;
  final String? hiddenFields;
  final List<int>? users;
  final int? classId;

  CreateAttemptUntSettingParams({
    required this.settings,
    required this.localeId,
    required this.subjectId,
    required this.time,
    this.hiddenFields,
    this.users,
    this.classId
  });

  DataMap toJson() {
    return {
      'settings': settings,
      'locale_id': localeId,
      'subject_id': subjectId,
      'time': time,
      'hidden_fields': hiddenFields,
      'users': users,
      'class_id': classId
    };
  }
}
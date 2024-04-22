import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_result_model.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_entity.dart';

class AttemptSettingModel extends AttemptSettingEntity {
  const AttemptSettingModel({
    required super.id,
    required super.subjectId,
    super.promoCode,
    required super.settings,
    required super.localeId,
    required super.time,
    required super.createdAt,
    required super.updatedAt,
    super.attemptSettingsResults,
    super.attemptUsers,
    super.classId,
    super.hiddenFields,
    super.locale,
    super.owner,
    super.ownerId,
    super.subject,
    super.users
  });

  factory AttemptSettingModel.fromJson(DataMap json) {
    return AttemptSettingModel(
        id: json['id'] as int,
        subjectId: json['subject_id'] as int,
        promoCode: json['promo_code'] != null ? json['promo_code'] as String : null,
        settings: json['settings'] as String,
        localeId: json['locale_id'] as int,
        time: json['time'] as int,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        attemptSettingsResults: json['attempt_settings_results'] != null ? AttemptSettingResultModel.fromJsonList(json['attempt_settings_results'].cast<DataMap>()) : null,
        attemptUsers: json['attempt_users'] != null ? OrdinaryUserForExamModel.fromJson(json['attempt_users']) : null,
        classId: json['class_id'] != null ? json['class_id'] as int : null,
        hiddenFields: json['hidden_fields'] != null ? json['hidden_fields'] as String : null,
        locale: json['locale'] != null ? LocaleModel.fromMap(json['locale']) : null,
        owner: json['owner'] != null ? OrdinaryUserModel.fromJson(json['owner']) : null,
        ownerId: json['owner_id'] != null ? json['owner_id'] as int : null,
        subject: json['subject'] != null ? SubjectModel.fromJson(json['subject']) : null,
        users: json['users'] != null ? OrdinaryUserForExamModel.fromJsonList(json['users'].cast<DataMap>()) : null,
    );
  }

}
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_unt_result_model.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_unt_entity.dart';

class AttemptSettingUntModel extends AttemptSettingUntEntity {
  const AttemptSettingUntModel({
    required super.id,
    required super.localeId,
    required super.senderId,
    super.settings,
    required super.time,
    required super.hiddenFields,
    required super.createdAt,
    super.attemptSettingsResultsUnt,
    super.attemptUsers,
    super.classId,
    super.locale,
    super.promoCode,
    super.sender,
    super.subjects,
    super.updatedAt,
    super.users
  });

  factory AttemptSettingUntModel.fromJson(DataMap json) {
    return AttemptSettingUntModel(
        id: json['id'] as int,
        localeId: json['locale_id'] as int,
        senderId: json['sender_id'] as int,
        settings: json['settings'] != null ? json['settings'] as String : null,
        time: json['time'] as int,
        hiddenFields: json['hidden_fields'] as String,
        createdAt: json['created_at'] as String,
        attemptSettingsResultsUnt: json['attempt_settings_results_unt'] != null ? AttemptSettingUntResultModel.fromJsonList(json['attempt_settings_results_unt'].cast<DataMap>()) : null,
        attemptUsers: json['attempt_users'] != null ? OrdinaryUserForExamModel.fromJson(json['attempt_users']) : null,
        classId: json['class_id'] != null ? json['class_id'] as int : null,
        locale: json['locale'] != null ? LocaleModel.fromJson(json['locale']) : null,
        promoCode: json['promo_code'] != null ? json['promo_code'] as String : null,
        sender: json['sender'] != null ? OrdinaryUserModel.fromJson(json['sender']) : null,
        subjects: json['subjects'] != null ? SubjectModel.fromJsonList(json['subjects'].cast<DataMap>()) : null,
        updatedAt: json['updated_at'] != null ? json['updated_at'] as String : null,
        users: json['users'] != null ? List<int>.from(json['users'].cast<int>()) : null
    );
  }

  static List<AttemptSettingUntModel> fromJsonList (List<DataMap> mapList) {
    return mapList.map((e) => AttemptSettingUntModel.fromJson(e)).toList();
  }

}
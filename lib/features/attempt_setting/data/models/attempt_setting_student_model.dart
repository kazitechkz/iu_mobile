import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_student_entity.dart';

class AttemptSettingStudentModel extends AttemptSettingStudentEntity {
  const AttemptSettingStudentModel({
    required super.id,
    required super.promoCode,
    super.classId,
    required super.settings,
    required super.localeId,
    required super.time,
    super.hiddenFields,
    required super.point,
    required super.createdAt,
    required super.updatedAt,
    required super.subjectId,
    required super.ownerId,
    super.locale,
    super.users,
    super.owner,
    super.subject
  });

  factory AttemptSettingStudentModel.fromJson(DataMap json) {
    return AttemptSettingStudentModel(
        id: json['id'] as int,
        promoCode: json['promo_code'] as String,
        classId: json['class_id'] != null ? json['class_id'] as int : null,
        settings: json['settings'] as String,
        localeId: json['locale_id'] as int,
        time: json['time'] as int,
        hiddenFields: json['hidden_fields'] != null ? json['hidden_fields'] as String : null,
        point: json['point'] as int,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        subjectId: json['subject_id'] as int,
        ownerId: json['owner_id'] as int,
        locale: json['locale'] != null ? LocaleModel.fromJson(json['locale']) : null,
        users: json['users'] != null ? OrdinaryUserModel.fromJsonList(json['users'].cast<DataMap>()) : null,
        owner: json['owner'] != null ? OrdinaryUserModel.fromJson(json['owner']) : null,
        subject: json['subject'] != null ? SubjectModel.fromJson(json['subject']) : null
    );
  }

  static List<AttemptSettingStudentModel> fromJsonList(List<DataMap> mapList) {
    return mapList.map((e) => AttemptSettingStudentModel.fromJson(e)).toList();
  }
}
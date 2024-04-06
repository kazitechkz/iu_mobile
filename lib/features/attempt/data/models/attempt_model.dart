import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/data/models/attempt_type_model.dart';
import 'package:iu/features/attempt/domain/entities/attempt_entity.dart';

import '../../../../core/utils/typedef.dart';

class AttemptModel extends AttemptEntity {
  const AttemptModel({
    required super.id,
    required super.typeId,
    required super.userId,
    required super.localeId,
    required super.startAt,
    super.endAt,
    required super.maxPoints,
    required super.points,
    required super.time,
    required super.timeLeft,
    AttemptTypeModel? super.attemptType,
    List<SubjectModel>? super.subjects,
    OrdinaryUserModel? super.user,
    LocaleModel? super.locale,
    super.deletedAt,
    super.createdAt,
    super.updatedAt,
  });

  AttemptModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          typeId: map["type_id"],
          userId: map["user_id"],
          localeId: map["locale_id"],
          startAt: map["start_at"],
          endAt: map["end_at"],
          maxPoints: map["max_points"],
          points: map["points"],
          time: map["time"],
          timeLeft: map["time_left"],
          attemptType: map["attempt_type"] != null
              ? AttemptTypeModel.fromJson(map["attempt_type"])
              : null,
          subjects: map["subjects"] != null
              ? SubjectModel.fromMapList(
                  map["subjects"].cast<Map<String, dynamic>>())
              : null,
          user: map["user"] != null
              ? OrdinaryUserModel.fromJson(map["user"])
              : null,
          locale: map["locale"] != null
              ? LocaleModel.fromJson(map["locale"])
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
        );

  factory AttemptModel.fromJson(Map<String, dynamic> json) {
    return AttemptModel.fromMap(json);
  }

  static List<AttemptModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => AttemptModel.fromMap(map)).toList();
  }
}

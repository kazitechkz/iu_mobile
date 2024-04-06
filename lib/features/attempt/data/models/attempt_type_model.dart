import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/attempt_type_entity.dart';

class AttemptTypeModel extends AttemptTypeEntity {
  const AttemptTypeModel({
    required super.id,
    required super.titleRu,
    required super.titleKk,
    super.titleEn,
    super.deletedAt,
    super.createdAt,
    super.updatedAt,
  });

  factory AttemptTypeModel.fromJson(Map<String, dynamic> json) {
    return AttemptTypeModel.fromMap(json);
  }

  AttemptTypeModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
        );

  static List<AttemptTypeModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => AttemptTypeModel.fromMap(map)).toList();
  }
}

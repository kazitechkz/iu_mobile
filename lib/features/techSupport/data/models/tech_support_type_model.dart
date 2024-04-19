import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tech_support_type_entity.dart';

class TechSupportTypeModel extends TechSupportTypeEntity {
  const TechSupportTypeModel(
      {required super.id,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      super.createdAt,
      super.updatedAt});

  TechSupportTypeModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory TechSupportTypeModel.fromJson(Map<String, dynamic> json) {
    return TechSupportTypeModel.fromMap(json);
  }

  static List<TechSupportTypeModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TechSupportTypeModel.fromMap(map)).toList();
  }
}

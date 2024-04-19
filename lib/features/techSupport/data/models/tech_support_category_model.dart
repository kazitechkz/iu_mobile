import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tech_support_category_entity.dart';

class TechSupportCategoryModel extends TechSupportCategoryEntity {
  const TechSupportCategoryModel(
      {required super.id,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      super.createdAt,
      super.updatedAt});

  TechSupportCategoryModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory TechSupportCategoryModel.fromJson(Map<String, dynamic> json) {
    return TechSupportCategoryModel.fromMap(json);
  }

  static List<TechSupportCategoryModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TechSupportCategoryModel.fromMap(map)).toList();
  }
}

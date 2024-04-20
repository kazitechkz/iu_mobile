import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/domain/entities/appeal_type_entity.dart';

class AppealTypeModel extends AppealTypeEntity {
  const AppealTypeModel({required super.id, required super.titleKk, required super.titleRu, required super.isActive});

  factory AppealTypeModel.fromJson(DataMap json) {
    return AppealTypeModel(
        id: json['id'] as int,
        titleKk: json['title_kk'] as String,
        titleRu: json['title_ru'] as String,
        isActive: json['isActive'] as bool
    );
  }

  static List<AppealTypeModel> fromJsonList(List<DataMap> mapList) {
    return mapList.map((value) => AppealTypeModel.fromJson(value)).toList();
  }
}
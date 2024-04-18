import '../../../../core/utils/typedef.dart';
import '../../domain/entities/notification_type_entity.dart';

class NotificationTypeModel extends NotificationTypeEntity {
  const NotificationTypeModel(
      {required super.id,
      required super.value,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      super.createdAt,
      super.updatedAt});

  NotificationTypeModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          value: map["value"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory NotificationTypeModel.fromJson(Map<String, dynamic> json) {
    return NotificationTypeModel.fromMap(json);
  }

  static List<NotificationTypeModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => NotificationTypeModel.fromMap(map)).toList();
  }
}

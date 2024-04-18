import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/notification/data/models/notification_type_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel(
      {required super.id,
      required super.typeId,
      super.classId,
      super.ownerId,
      super.users,
      required super.title,
      required super.message,
      super.createdAt,
      super.updatedAt,
      OrdinaryUserModel? super.owner,
      NotificationTypeModel? super.notificationType});

  NotificationModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          typeId: map["type_id"],
          classId: map["class_id"],
          ownerId: map["owner_id"],
          users: map["users"] != null ? map["users"].cast<int>() : null,
          title: map["title"],
          message: map["message"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          owner: map["owner"] != null
              ? OrdinaryUserModel.fromMap(map["owner"])
              : null,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel.fromMap(json);
  }

  static List<NotificationModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => NotificationModel.fromMap(map)).toList();
  }
}

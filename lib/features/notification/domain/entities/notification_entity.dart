import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';

import 'notification_type_entity.dart';

class NotificationEntity extends Equatable {
  final int id;
  final int typeId;
  final int? classId;
  final int? ownerId;
  final List<int>? users;
  final String title;
  final String message;
  final String? createdAt;
  final String? updatedAt;
  final OrdinaryUserEntity? owner;
  final NotificationTypeEntity? notificationType;

  const NotificationEntity(
      {required this.id,
      required this.typeId,
      this.classId,
      this.ownerId,
      this.users,
      required this.title,
      required this.message,
      this.createdAt,
      this.updatedAt,
      this.owner,
      this.notificationType});

  @override
  List<Object?> get props => [
        id,
        typeId,
        classId,
        ownerId,
        users,
        title,
        message,
        createdAt,
        updatedAt,
        owner,
        notificationType
      ];
}

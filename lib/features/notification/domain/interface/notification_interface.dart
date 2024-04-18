import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/notification/domain/entities/notification_entity.dart';
import 'package:iu/features/notification/domain/parameters/get_notification_all_parameter.dart';

import '../entities/notification_type_entity.dart';

abstract class NotificationInterface{
  ResultFuture<bool> checkNotification(int parameter);
  ResultFuture<PaginationData<List<NotificationEntity>>> getNotificationAll(GetNotificationAllParameter parameter);
  ResultFuture<List<NotificationTypeEntity>> getNotificationType();
  ResultFuture<int> getUnreadMessageCount();
  ResultFuture<List<int>> myNotificationIds();
}
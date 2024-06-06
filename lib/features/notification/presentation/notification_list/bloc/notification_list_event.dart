part of 'notification_list_bloc.dart';

@immutable
abstract class NotificationListEvent {}

class NotificationListGetAllEvent extends NotificationListEvent{
  final GetNotificationAllParameter parameter;
  NotificationListGetAllEvent({required this.parameter});
}


class NotificationListGetMyIdsEvent extends NotificationListEvent{

}

class CheckNotificationEvent extends NotificationListEvent{
    final int notificationId;
    CheckNotificationEvent({required this.notificationId});
}

class NotificationListCheckActiveNotificationEvent extends NotificationListEvent{
  final NotificationEntity notification;
  NotificationListCheckActiveNotificationEvent({required this.notification});
}
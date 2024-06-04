part of 'notification_list_bloc.dart';

@immutable
abstract class NotificationListState extends Equatable {}

class NotificationListInitialState extends NotificationListState {
  @override
  List<Object?> get props => [];
}

class NotificationListLoadingState extends NotificationListState {
  @override
  List<Object?> get props => [];
}

class NotificationListFailedState extends NotificationListState {
  final FailureData failureData;

  NotificationListFailedState({required this.failureData});

  @override
  List<Object?> get props => [failureData];
}

class NotificationListSuccessState extends NotificationListState {
  final List<int>? notificationIDS;
  final PaginationData<List<NotificationEntity>> notificationEntity;
  final List<NotificationEntity> notifications;

  NotificationListSuccessState(
      {this.notificationIDS,required this.notificationEntity,required this.notifications});

  NotificationListSuccessState copyWith({
     List<int>? NotificationIDS,
     PaginationData<List<NotificationEntity>>? NotificationEntity,
     List<NotificationEntity>? Notifications,
}){
    return NotificationListSuccessState(
      notificationIDS: NotificationIDS ?? notificationIDS,
      notificationEntity: NotificationEntity?? notificationEntity,
      notifications: Notifications ?? notifications
    );
  }

  @override
  List<Object?> get props =>
      [notificationIDS, notificationEntity, notifications];
}

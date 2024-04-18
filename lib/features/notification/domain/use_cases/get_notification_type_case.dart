import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/notification_type_entity.dart';
import '../interface/notification_interface.dart';

class GetNotificationTypeCase
    extends UseCaseWithoutParams<List<NotificationTypeEntity>> {
  final NotificationInterface _notificationInterface;

  const GetNotificationTypeCase(this._notificationInterface);

  @override
  ResultFuture<List<NotificationTypeEntity>> call() {
    return this._notificationInterface.getNotificationType();
  }
}

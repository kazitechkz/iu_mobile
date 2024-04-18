import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/notification/domain/interface/notification_interface.dart';

class CheckNotificationCase extends UseCaseWithParams<bool, int> {
  final NotificationInterface _notificationInterface;

  const CheckNotificationCase(this._notificationInterface);

  @override
  ResultFuture<bool> call(int params) {
    return this._notificationInterface.checkNotification(params);
  }
}

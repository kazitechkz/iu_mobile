import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../interface/notification_interface.dart';

class MyNotificationIdsCase extends UseCaseWithoutParams<List<int>> {
  final NotificationInterface _notificationInterface;

  const MyNotificationIdsCase(this._notificationInterface);

  @override
  ResultFuture<List<int>> call() {
    return this._notificationInterface.myNotificationIds();
  }
}

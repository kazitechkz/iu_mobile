import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../interface/notification_interface.dart';

class GetUnreadMessageCountCase extends UseCaseWithoutParams<int> {
  final NotificationInterface _notificationInterface;

  const GetUnreadMessageCountCase(this._notificationInterface);

  @override
  ResultFuture<int> call() {
    return this._notificationInterface.getUnreadMessageCount();
  }
}

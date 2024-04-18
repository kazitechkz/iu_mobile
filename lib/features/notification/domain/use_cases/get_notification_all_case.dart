import 'package:iu/core/utils/typedef.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/notification_entity.dart';
import '../interface/notification_interface.dart';
import '../parameters/get_notification_all_parameter.dart';

class GetNotificationAllCase extends UseCaseWithParams<
    PaginationData<List<NotificationEntity>>, GetNotificationAllParameter> {
  final NotificationInterface _notificationInterface;

  const GetNotificationAllCase(this._notificationInterface);

  @override
  ResultFuture<PaginationData<List<NotificationEntity>>> call(
      GetNotificationAllParameter params) {
    return this._notificationInterface.getNotificationAll(params);
  }
}

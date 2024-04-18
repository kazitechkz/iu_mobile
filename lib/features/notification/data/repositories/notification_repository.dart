import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/notification/data/datasources/notification_datasource.dart';
import 'package:iu/features/notification/domain/entities/notification_entity.dart';
import 'package:iu/features/notification/domain/entities/notification_type_entity.dart';
import 'package:iu/features/notification/domain/interface/notification_interface.dart';
import 'package:iu/features/notification/domain/parameters/get_notification_all_parameter.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class NotificationRepository implements NotificationInterface {
  final NotificationDataSourceInterface notificationDataSourceInterface;

  const NotificationRepository(this.notificationDataSourceInterface);

  @override
  ResultFuture<bool> checkNotification(int parameter) async {
    try {
      final result = await this
          .notificationDataSourceInterface
          .checkNotificationDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<PaginationData<List<NotificationEntity>>> getNotificationAll(
      GetNotificationAllParameter parameter) async {
    try {
      final result = await this
          .notificationDataSourceInterface
          .getNotificationAllDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<List<NotificationTypeEntity>> getNotificationType() async {
    try {
      final result =
          await this.notificationDataSourceInterface.getNotificationTypeDS();
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<int> getUnreadMessageCount() async {
    try {
      final result =
          await this.notificationDataSourceInterface.getUnreadMessageCountDS();
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<List<int>> myNotificationIds() async {
    try {
      final result =
          await this.notificationDataSourceInterface.myNotificationIdsDS();
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }
}

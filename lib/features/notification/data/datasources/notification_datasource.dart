import 'package:dio/dio.dart';
import 'package:iu/features/notification/data/models/notification_model.dart';
import 'package:iu/features/notification/data/models/notification_type_model.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/entities/notification_type_entity.dart';
import '../../domain/parameters/get_notification_all_parameter.dart';

abstract class NotificationDataSourceInterface{
  Future<bool> checkNotificationDS(int parameter);
  Future<PaginationData<List<NotificationEntity>>> getNotificationAllDS(GetNotificationAllParameter parameter);
  Future<List<NotificationTypeEntity>> getNotificationTypeDS();
  Future<int> getUnreadMessageCountDS();
  Future<List<int>> myNotificationIdsDS();
}

class NotificationDataSourceImpl extends NotificationDataSourceInterface{
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<bool> checkNotificationDS(int parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.checkNotification + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = responseData.data as bool;
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<NotificationEntity>>> getNotificationAllDS(GetNotificationAllParameter parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getNotificationAll,data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final paginationData = PaginationData.fromMap(responseData.data);
      final data = NotificationModel.fromMapList(paginationData.data.cast<Map<String, dynamic>>());
      final result = PaginationData.fromType(paginationData, data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<NotificationTypeEntity>> getNotificationTypeDS()async {
    try {
      final response = await HttpUtil().get(ApiConstant.getNotificationTypeAll);
      final responseData = ResponseData.fromJson(response);
      final result = NotificationTypeModel.fromMapList(responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<int> getUnreadMessageCountDS()async {
    try {
      final response = await HttpUtil().get(ApiConstant.getUnreadMessageCount);
      final responseData = ResponseData.fromJson(response);
      final result = responseData.data as int;
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<int>> myNotificationIdsDS()async {
    try {
      final response = await HttpUtil().get(ApiConstant.myNotificationIds);
      final responseData = ResponseData.fromJson(response);
      final result = responseData.data.cast<int>();
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
  
  
}
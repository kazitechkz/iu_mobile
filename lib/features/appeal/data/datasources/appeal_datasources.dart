import 'package:dio/dio.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/errors/exception.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/data/models/appeal_type_model.dart';
import 'package:iu/features/appeal/domain/entities/appeal_entity.dart';
import 'package:iu/features/appeal/domain/entities/appeal_type_entity.dart';
import 'package:iu/features/appeal/domain/parameters/appeal_params.dart';
import 'package:iu/features/appeal/domain/parameters/create_appeal_params.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../models/appeal_model.dart';

abstract class AppealDatasourceInterface {
  Future<List<AppealTypeEntity>> getAppealTypes();
  Future<bool> createAppeal(CreateAppealParams params);
  Future<PaginationData<List<AppealEntity>>> getMyAppeals(AppealParams params);
  Future<AppealEntity> getMyAppealById(int appealId);
}

class AppealDatasourceInterfaceImpl implements AppealDatasourceInterface {
  final httpUtils = HttpUtil();
  @override
  Future<List<AppealTypeEntity>> getAppealTypes() async {
    try {
      final response = await httpUtils.get(ApiConstant.getAppealTypes);
      final ResponseData responseData = ResponseData.fromJson(response);
      return AppealTypeModel.fromJsonList(responseData.data.cast<DataMap>());
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> createAppeal(CreateAppealParams params) async {
    try {
      final response = await httpUtils.post(ApiConstant.createAppeal, data: params.toJson());
      final ResponseData responseData = ResponseData.fromJson(response);
      return responseData.data as bool;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<AppealEntity>>> getMyAppeals(AppealParams params) async {
    try {
      final response = await httpUtils.get(ApiConstant.getMyAppeals, data: params.toMap());
      final ResponseData responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<AppealEntity> data = AppealModel.fromListJson(paginationData.data.cast<DataMap>());
      final result = PaginationData.fromType(paginationData, data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<AppealEntity> getMyAppealById(int appealId) async {
    try {
      final response = await httpUtils.get('${ApiConstant.getMyAppealById}$appealId');
      final ResponseData responseData = ResponseData.fromJson(response);
      return AppealModel.fromJson(responseData.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
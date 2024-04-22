import 'package:dio/dio.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pagination_parameter.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_model.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_student_model.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_unt_model.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_student_entity.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_unt_entity.dart';
import 'package:iu/features/attempt_setting/domain/parameters/create_attempt_setting_params.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../domain/entities/attempt_setting_entity.dart';

abstract class AttemptSettingDatasourceInterface {
  Future<AttemptSettingEntity> createAttemptSetting(CreateAttemptSettingParams params);
  Future<PaginationData<List<AttemptSettingStudentEntity>>> myAttemptSettingSingle(PaginationParameter params);
  Future<PaginationData<List<AttemptSettingUntEntity>>> myAttemptSettingUnt(PaginationParameter params);
}

class AttemptSettingDatasourceImpl implements AttemptSettingDatasourceInterface {
  final httpUtils = HttpUtil();

  @override
  Future<AttemptSettingEntity> createAttemptSetting(CreateAttemptSettingParams params) async {
    try {
      final response = await httpUtils.post(ApiConstant.createAttemptSettings, data: params.toJson());
      final responseData = ResponseData.fromJson(response);
      AttemptSettingEntity data = AttemptSettingModel.fromJson(responseData.data);
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<AttemptSettingStudentEntity>>> myAttemptSettingSingle(PaginationParameter params) async {
    try {
      final response = await httpUtils.get(ApiConstant.myAttemptSettingsSingle, data: params.toMap());
      final responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<AttemptSettingStudentEntity> data = AttemptSettingStudentModel.fromJsonList(paginationData.data.cast<DataMap>());
      return PaginationData.fromType(paginationData, data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<AttemptSettingUntEntity>>> myAttemptSettingUnt(PaginationParameter params) async {
    try {
      final response = await httpUtils.get(ApiConstant.myAttemptSettingsUnt, data: params.toMap());
      final responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<AttemptSettingUntEntity> data = AttemptSettingUntModel.fromJsonList(paginationData.data.cast<DataMap>());
      return PaginationData.fromType(paginationData, data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
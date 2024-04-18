import 'package:dio/dio.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';
import '../models/sub_step_model.dart';

abstract class SubStepDataSourceInterface {
  Future<List<SubStepEntity>> getSubSteps(String stepID);
  Future<SubStepEntity> getSubStepDetail(String subStepID);
}

class SubStepDataSourceImpl extends SubStepDataSourceInterface {
  final httpUtils = HttpUtil();

  @override
  Future<List<SubStepEntity>> getSubSteps(String stepID) async {
    try {
      final response = await httpUtils.get(ApiConstant.getSubSteps + stepID);
      final responseData = ResponseData.fromJson(response);
      List<SubStepEntity> data = SubStepModel.fromMapList(
          responseData.data.cast<Map<String, dynamic>>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<SubStepEntity> getSubStepDetail(String subStepID) async {
    try {
      final response = await httpUtils.get(ApiConstant.getSubStepDetail + subStepID);
      final responseData = ResponseData.fromJson(response);
      SubStepEntity data = SubStepModel.fromJson(responseData.data);
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
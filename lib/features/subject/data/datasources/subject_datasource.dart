import 'package:dio/dio.dart';
import 'package:iu/core/common/models/subject.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';

abstract class SubjectDatasourceInterface {
  Future<List<SubjectEntity>> getSubjects();
  Future<List<SubjectEntity>> getMySubjects();
}

class SubjectDatasourceImpl implements SubjectDatasourceInterface {
  final httpUtils = HttpUtil();

  @override
  Future<List<SubjectEntity>> getSubjects() async {
    try {
      final response = await httpUtils.get(ApiConstant.getSubjects);
      final responseData = ResponseData.fromJson(response);
      List<SubjectEntity> data = SubjectModel.fromMapList(
          responseData.data.cast<Map<String, dynamic>>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<SubjectEntity>> getMySubjects() async {
    try {
      final response = await httpUtils.get(ApiConstant.getMySubjects);
      final responseData = ResponseData.fromJson(response);
      List<SubjectEntity> data = SubjectModel.fromMapList(
          responseData.data.cast<Map<String, dynamic>>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
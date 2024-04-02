import 'package:dio/dio.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/common/models/subject.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';

abstract class UntDataSourceInterface{
  Future<List<SubjectEntity>> getSubjectsDS();
}

class UntDataSourceImpl implements UntDataSourceInterface{
  final httpUtils = HttpUtil();
  @override
  Future<List<SubjectEntity>> getSubjectsDS()async {
    try {
      final result = await httpUtils.get(ApiConstant.getAllSubjects);
      ResponseData<List<dynamic>> data = ResponseData<List<dynamic>>.fromJson(result);
      List<SubjectEntity> subjects = [];
      data.data?.forEach((element) {
        subjects.add(SubjectModel.fromJson(element));
      });
      return subjects;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
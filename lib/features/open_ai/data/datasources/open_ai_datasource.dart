import 'package:dio/dio.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/open_ai/domain/parameters/open_ai_params.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';

abstract class OpenAiDatasourceInterface {
  Future<String> getAiAnswer(OpenAiParams params);
}

class OpenAiDatasourceImpl implements OpenAiDatasourceInterface {
  final httpUtils = HttpUtil();
  @override
  Future<String> getAiAnswer(OpenAiParams params) async {
    try {
      final response =
      await httpUtils.get(ApiConstant.getAiAnswer + params.questionId.toString());
      final responseData = ResponseData.fromJson(response);
      return responseData.data.toString();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
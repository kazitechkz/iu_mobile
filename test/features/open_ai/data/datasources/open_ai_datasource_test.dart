import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/open_ai/domain/parameters/open_ai_params.dart';

Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 5000),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  dio.interceptors.add(BearerTokenInterceptor(
      "2648|whkJH8362xQCRmRfBkPyHVby57A3Ii5LJIU8M5ZB03c86a9a"));
  sl.registerLazySingleton<Dio>(() => dio);
  OpenAiParams params = const OpenAiParams(questionId: 12543);
  final response = await HttpUtil().get(ApiConstant.getAiAnswer + params.questionId.toString());
  final responseData = ResponseData.fromJson(response);
  print(responseData.data.toString());
}
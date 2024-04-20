import 'dart:async';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/data/models/appeal_type_model.dart';
import 'package:iu/features/appeal/domain/parameters/create_appeal_params.dart';

Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  dio.interceptors.add(BearerTokenInterceptor(
      "2304|T7kXl6GZGM02BIYqqr9ClEMwqlfIngNPzqt11hj76e5aa493"));
  sl.registerLazySingleton<Dio>(() => dio);
  CreateAppealParams params = const CreateAppealParams(message: 'message', questionId: 12728, typeId: 2);
  final response = await HttpUtil().post(ApiConstant.createAppeal, data: params.toJson());
  final ResponseData responseData = ResponseData.fromJson(response);
  final bool data = responseData.data;
  print(data);
}

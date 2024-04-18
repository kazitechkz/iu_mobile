import 'dart:async';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_model.dart';

Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  dio.interceptors.add(BearerTokenInterceptor(
      "1883|MIGNF6HWbEb4SBgMWnrDj5YLekF0YvTX0FlYCN7Wbc7dc5da"));
  sl.registerLazySingleton<Dio>(() => dio);
  final response = await HttpUtil().get(
      '${ApiConstant.getSubStepDetail}1');
  final responseData = ResponseData.fromJson(response);
  SubStepModel step = SubStepModel.fromJson(responseData.data);
  print(step);
}

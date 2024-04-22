import 'dart:async';
import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/news/data/models/news_model.dart';
import 'package:iu/features/news/domain/entities/news_entity.dart';
import 'package:iu/features/news/domain/parameters/all_news_parameter.dart';


Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  dio.interceptors.add(BearerTokenInterceptor(
      "729|D17xu8wYdSjkgawAd4rSu8sbcvCPIkf4QGXH8FpR660bb4f8"));
  sl.registerLazySingleton<Dio>(() => dio);
  AllNewsParameter parameter = AllNewsParameter(page: 1);
  final httpUtils = HttpUtil();
  final response = await httpUtils
      .get(ApiConstant.getSingleNews + 2.toString());
  final responseData = ResponseData.fromJson(response);
  final result = NewsModel.fromMap(responseData.data);
  print(result);


}

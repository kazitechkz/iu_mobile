import 'dart:async';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/categories.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';

Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  dio.interceptors.add(BearerTokenInterceptor(
      "1885|sZmQ6qH43HNUoqtp5b6TqIXXPprNNkmJpaKbE3ZR70018b0b"));
  sl.registerLazySingleton<Dio>(() => dio);
  final response = await HttpUtil().get('${ApiConstant.getSubCategories}/1/1');
  final responseData = ResponseData.fromJson(response);
  List<SubCategoryEntity> data = SubCategoryModel.fromMapList(
      responseData.data.cast<DataMap>());
  print(data);
}

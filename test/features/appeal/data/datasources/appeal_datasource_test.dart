import 'dart:async';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/data/models/appeal_model.dart';
import 'package:iu/features/appeal/data/models/appeal_type_model.dart';
import 'package:iu/features/appeal/domain/entities/appeal_entity.dart';
import 'package:iu/features/appeal/domain/parameters/appeal_params.dart';

// Future<void> main() async {
//   BaseOptions options = BaseOptions(
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 5),
//       headers: {'Accept': "application/json;"},
//       contentType: "application/json;charset=utf-8",
//       responseType: ResponseType.json);
//   final dio = Dio(options);
//   dio.interceptors.add(BearerTokenInterceptor(
//       "2304|T7kXl6GZGM02BIYqqr9ClEMwqlfIngNPzqt11hj76e5aa493"));
//   sl.registerLazySingleton<Dio>(() => dio);
//   final response = await HttpUtil().get(ApiConstant.getAppealTypes);
//   final ResponseData responseData = ResponseData.fromJson(response);
//   final data = AppealTypeModel.fromJsonList(responseData.data.cast<DataMap>());
//   print(data);
// }

// Future<void> main() async {
//   BaseOptions options = BaseOptions(
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 5),
//       headers: {'Accept': "application/json;"},
//       contentType: "application/json;charset=utf-8",
//       responseType: ResponseType.json);
//   final dio = Dio(options);
//   dio.interceptors.add(BearerTokenInterceptor(
//       "2304|T7kXl6GZGM02BIYqqr9ClEMwqlfIngNPzqt11hj76e5aa493"));
//   sl.registerLazySingleton<Dio>(() => dio);
//   AppealParams params = const AppealParams(page: 1);
//   final response = await HttpUtil().get(ApiConstant.getMyAppeals, data: params.toMap());
//   final ResponseData responseData = ResponseData.fromJson(response);
//   PaginationData paginationData = PaginationData.fromMap(responseData.data);
//   List<AppealEntity> data = AppealModel.fromListJson(paginationData.data.cast<DataMap>());
//   final result = PaginationData.fromType(paginationData, data);
//   print(result.data);
// }

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
  final response = await HttpUtil().get('${ApiConstant.getMyAppealById}74');
  final ResponseData responseData = ResponseData.fromJson(response);
  AppealEntity data = AppealModel.fromJson(responseData.data);
  print(data);
}
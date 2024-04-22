import 'dart:async';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pagination_parameter.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_model.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_student_model.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_unt_model.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_entity.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_student_entity.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_unt_entity.dart';
import 'package:iu/features/attempt_setting/domain/parameters/create_attempt_setting_params.dart';

// Future<void> main() async {
//   BaseOptions options = BaseOptions(
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 5),
//       headers: {'Accept': "application/json;"},
//       contentType: "application/json;charset=utf-8",
//       responseType: ResponseType.json);
//   final dio = Dio(options);
//   dio.interceptors.add(BearerTokenInterceptor(
//       "2648|whkJH8362xQCRmRfBkPyHVby57A3Ii5LJIU8M5ZB03c86a9a"));
//   sl.registerLazySingleton<Dio>(() => dio);
//   CreateAttemptSettingParams params = CreateAttemptSettingParams(
//       settings: '{"1":{"s_questions":0,"c_questions":0,"m_questions":0,"sub_category_ids":{"1":{"c_questions":null,"s_questions":"20","m_questions":null},"5":{"c_questions":null,"s_questions":"10","m_questions":null}}},"8":{"s_questions":0,"c_questions":0,"m_questions":0,"sub_category_ids":{"30":{"c_questions":null,"s_questions":"10","m_questions":null},"33":{"c_questions":null,"s_questions":"10","m_questions":null}}}}',
//       users: [113],
//       localeId: 1,
//       subjectId: 1,
//       time: 45
//   );
//   final response = await HttpUtil().post(ApiConstant.createAttemptSettings, data: params.toJson());
//   final responseData = ResponseData.fromJson(response);
//   AttemptSettingEntity data = AttemptSettingModel.fromJson(responseData.data);
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
//       "2648|whkJH8362xQCRmRfBkPyHVby57A3Ii5LJIU8M5ZB03c86a9a"));
//   sl.registerLazySingleton<Dio>(() => dio);
//   PaginationParameter params = const PaginationParameter(
//       page: 1
//   );
//   final response = await HttpUtil().get(ApiConstant.myAttemptSettingsSingle, data: params.toMap());
//   final responseData = ResponseData.fromJson(response);
//   PaginationData paginationData = PaginationData.fromMap(responseData.data);
//   List<AttemptSettingStudentEntity> data = AttemptSettingStudentModel.fromJsonList(paginationData.data.cast<DataMap>());
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
      "2648|whkJH8362xQCRmRfBkPyHVby57A3Ii5LJIU8M5ZB03c86a9a"));
  sl.registerLazySingleton<Dio>(() => dio);
  PaginationParameter params = const PaginationParameter(
      page: 1
  );
  final response = await HttpUtil().get(ApiConstant.myAttemptSettingsUnt, data: params.toMap());
  final responseData = ResponseData.fromJson(response);
  PaginationData paginationData = PaginationData.fromMap(responseData.data);
  List<AttemptSettingUntEntity> data = AttemptSettingUntModel.fromJsonList(paginationData.data.cast<DataMap>());
  final result = PaginationData.fromType(paginationData, data);
  print(result.data);
}

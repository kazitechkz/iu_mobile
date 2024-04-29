import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/attempt/data/models/answer_result_model.dart';
import 'package:iu/features/attempt/data/models/answered_result_model.dart';
import 'package:iu/features/attempt/data/models/attempt_common_model.dart';
import 'package:iu/features/attempt/data/models/attempt_model.dart';
import 'package:iu/features/attempt/data/models/attempt_type_model.dart';
import 'package:iu/features/attempt/data/models/finish_attempt_model.dart';
import 'package:iu/features/attempt/data/models/get_stat_model.dart';
import 'package:iu/features/attempt/data/models/unt_stat_model.dart';
import 'package:iu/features/attempt/domain/entities/attempt_type_entity.dart';
import 'package:iu/features/attempt/domain/entities/finish_attempt_entity.dart';
import 'package:iu/features/attempt/domain/entities/unt_stat_entity.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/answered_result_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/create_attempt_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/save_question_parameter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  dio.interceptors.add(BearerTokenInterceptor(
      "1544|m0AS6Nq3oX2sv5xCP9kyBJ5xq0yZAlVz47GgY4wh6fe182df"));
  sl.registerLazySingleton<Dio>(() => dio);
  final response =
      await HttpUtil().get(ApiConstant.getAttemptById + 842.toString());
  final data = ResponseData.fromJson(response);
  final result = AttemptCommonModel.fromJson(data.data);
  print(result);
}

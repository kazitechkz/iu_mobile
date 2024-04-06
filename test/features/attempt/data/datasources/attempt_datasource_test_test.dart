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
  // BaseOptions options = BaseOptions(
  //     connectTimeout: const Duration(seconds: 5),
  //     receiveTimeout: const Duration(seconds: 5),
  //     headers: {'Accept': "application/json;"},
  //     contentType: "application/json;charset=utf-8",
  //     responseType: ResponseType.json);
  // final dio = Dio(options);
  // dio.interceptors.add(BearerTokenInterceptor(
  //     "715|NEXf8pSGQ6B8tQ9WLRPYb2gJQQTIiLi9xTJ1Ljpe9d9dbde1"));
  // sl.registerLazySingleton<Dio>(() => dio);
  // SaveQuestionParameter saveQuestionParameter =
  //     new SaveQuestionParameter(23363);
  // final response = await HttpUtil().get(
  //     ApiConstant.saveQuestion + saveQuestionParameter.questionId.toString());
  // final result = ResponseData<bool>.fromJson(response);
  // print(result.data);
}

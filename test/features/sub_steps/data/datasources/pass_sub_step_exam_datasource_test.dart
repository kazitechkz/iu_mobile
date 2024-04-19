import 'dart:async';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_exam_model.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_exam_entity.dart';
import 'package:iu/features/sub_steps/domain/parameters/pass_sub_step_exam_params.dart';

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
  final List<PassSubStepExamParams> params = [
    const PassSubStepExamParams(answer: 'c', locale_id: 1, sub_step_test_id: 289),
    const PassSubStepExamParams(answer: 'b', locale_id: 1, sub_step_test_id: 288),
    const PassSubStepExamParams(answer: 'a', locale_id: 1, sub_step_test_id: 287),
    const PassSubStepExamParams(answer: 'c', locale_id: 1, sub_step_test_id: 286),
    const PassSubStepExamParams(answer: 'd', locale_id: 1, sub_step_test_id: 285),
    const PassSubStepExamParams(answer: 'c', locale_id: 1, sub_step_test_id: 284),
    const PassSubStepExamParams(answer: 'c', locale_id: 1, sub_step_test_id: 283),
    const PassSubStepExamParams(answer: 'a', locale_id: 1, sub_step_test_id: 282),
  ];
  List<DataMap> paramsJson = params.map((e) => e.toJson()).toList();
  final response = await HttpUtil().post(ApiConstant.passSubStepExam, data: paramsJson);
  final responseData = ResponseData.fromJson(response);
  int data = responseData.data;
  print(data);
}

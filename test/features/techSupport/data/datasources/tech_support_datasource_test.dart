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
import 'package:iu/features/notification/data/models/notification_model.dart';
import 'package:iu/features/notification/data/models/notification_type_model.dart';
import 'package:iu/features/notification/domain/parameters/get_notification_all_parameter.dart';
import 'package:iu/features/techSupport/data/models/get_tech_support_ticket_detail_model.dart';
import 'package:iu/features/techSupport/data/models/tech_support_category_model.dart';
import 'package:iu/features/techSupport/data/models/tech_support_message_model.dart';
import 'package:iu/features/techSupport/data/models/tech_support_ticket_model.dart';
import 'package:iu/features/techSupport/data/models/tech_support_type_model.dart';
import 'package:iu/features/techSupport/domain/parameters/close_tech_support_ticket_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/create_tech_support_message_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/create_tech_support_ticket_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/get_my_tech_support_tickets_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/get_tech_support_ticket_detail_parameter.dart';


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
  final httpUtils = HttpUtil();
  GetTechSupportTicketDetailParameter parameter = GetTechSupportTicketDetailParameter(ticket_id: 5, page: 1);
  final response = await HttpUtil().get(ApiConstant.getTechSupportTypes);
  final responseData = ResponseData.fromJson(response);
  List<TechSupportTypeModel> result = TechSupportTypeModel.fromMapList(responseData.data.cast<Map<String, dynamic>>());
  print(responseData.data);


}
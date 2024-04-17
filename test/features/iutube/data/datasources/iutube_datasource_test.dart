import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/iutube/data/models/get_main_videos_model.dart';
import 'package:iu/features/iutube/data/models/get_video_author_detail_model.dart';
import 'package:iu/features/iutube/data/models/get_video_detail_model.dart';
import 'package:iu/features/iutube/data/models/iutube_video_model.dart';
import 'package:iu/features/iutube/domain/parameters/get_all_videos_parameter.dart';
import 'package:iu/features/iutube/domain/parameters/get_video_author_detail_parameter.dart';
import 'package:iu/features/iutube/domain/parameters/get_video_detail_parameter.dart';

Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  String userOne = "727|Xqz6up1QlOVurDx8yD4GLksEkqCnDOvynnTevSM7d89d8ed0";
  String userTwo = "728|Aojj066JSNJt7I0DT0BcCMOmtdD1CCLd99hLe8OB80091cab";
  dio.interceptors.add(BearerTokenInterceptor(
      userTwo));
  sl.registerLazySingleton<Dio>(() => dio);
  GetVideoDetailParameter parameter = GetVideoDetailParameter(alias: "600f0cbd-d038-407c-8b42-9599cf8b5a53");
  final response = await HttpUtil().get(ApiConstant.getVideoDetail + parameter.alias.toString());
  final responseData = ResponseData.fromJson(response);
  final result = GetVideoDetailModel.fromMap(responseData.data);
  print(result);
}
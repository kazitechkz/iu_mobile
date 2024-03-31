import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/interceptors/error_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/auth/data/models/auth_info_model.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';

void main() async {
  final dio = Dio();
  dio.interceptors.add(ServerErrorInterceptor());
  sl.registerLazySingleton<Dio>(() => dio);
  final httpUtils = HttpUtil();
  final parameter =
      SignInParameter(email: "user_one@gmail.com", password: "admin123");
  final result = await httpUtils.post(ApiConstant.backApiLogin,
      queryParameters: parameter.toMap());
  print(result["data"]);
  final data = AuthInfoModel.fromMap(result["data"]);
  print(data.user.email);
}

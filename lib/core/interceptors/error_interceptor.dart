import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:iu/core/utils/toasters.dart';

class ServerErrorInterceptor extends Interceptor {
  final GoRouter goRouter;
  ServerErrorInterceptor(this.goRouter);

  @override
  void onError(err, ErrorInterceptorHandler handler) {
    try {
      if (err.response != null) {
        final responseData = err.response!.data;
        if (err.response!.statusCode == 401) {
          AppToaster.showError("Повторите попытку входа");
          // Очистка данных пользователя в Hive
          HiveUtils().loggedOutFromHive().then((_) {
            // Перенаправление пользователя на экран входа
            goRouter.goNamed(RouteConstant.authScreenName);
          });
        }
        handler.next(err);
      } else {
        handler.next(err);
      }
    } catch (e) {
      // Ловим любые другие ошибки, которые могли бы пропустить
      print('Unexpected error: $e');
    }
  }

  void _handleUnauthorized() {}
}

import 'package:dio/dio.dart';
import 'package:iu/core/errors/exception.dart';

class ServerErrorInterceptor extends Interceptor {
  @override
  void onError(err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      final responseData = err.response!.data;
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}

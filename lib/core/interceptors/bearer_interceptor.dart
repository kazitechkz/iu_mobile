import 'package:dio/dio.dart';

class BearerTokenInterceptor extends Interceptor {
  final String? token;

  BearerTokenInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(token != null){
      // print(token);
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
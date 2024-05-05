import 'dart:convert';

import 'package:dio/dio.dart';

import '../errors/exception.dart';
import '../services/injection_main.container.dart';

class HttpUtil {
  final Dio dio = sl<Dio>();

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: {"Content-Type": "application/json"},
          ));
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future get(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.get(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(contentType: Headers.jsonContentType));
      return response.data;
    } on DioException catch (e) {
      print(e);
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      print(e);
      throw ApiException(message: e.toString());
    }
  }

  Future update(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: {"Content-Type": "application/json"},
          ));
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

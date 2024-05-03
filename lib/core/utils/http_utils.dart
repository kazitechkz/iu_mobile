import 'dart:convert';

import 'package:dio/dio.dart';

import '../errors/exception.dart';
import '../services/injection_main.container.dart';

class HttpUtil {
  final Dio dio = sl<Dio>();

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      var response =
          await dio.post(path, data: data, queryParameters: queryParameters);
      var dataReady = jsonDecode(response.data);
      return dataReady;
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
          queryParameters: queryParameters); // to avoid utf-8 errors
      return response.data;
    } on DioException catch (e) {
      print(e.error);
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future update(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      var response =
          await dio.put(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

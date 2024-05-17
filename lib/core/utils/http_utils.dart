import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../errors/exception.dart';
import '../services/injection_main.container.dart';

class HttpUtil {
  final Dio dio = sl<Dio>();

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.post(path,
        data: data,
        queryParameters: queryParameters);
    return response.data;
  }

  Future get(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(contentType: Headers.jsonContentType));
    return response.data;
  }

  Future update(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ));
    return response.data;
  }
}

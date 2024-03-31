import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../common/models/response_data.dart';

class ApiException extends Equatable implements Exception {
  const ApiException({this.message, this.statusCode, this.errors});

  final String? message;
  final int? statusCode;
  final Errors? errors;

  factory ApiException.fromDioError(DioException dioError) {
    int? statusCode = dioError.response?.statusCode;
    Map<String, dynamic>? errorsStr = dioError.response?.data["errors"];
    String? message = dioError.response?.data["message"];
    return ApiException(
        message: message,
        statusCode: statusCode,
        errors: errorsStr != null ? Errors.fromJson(errorsStr) : null);
  }

  @override
  // TODO: implement props
  List<dynamic> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  const CacheException({this.message, this.statusCode, this.errors});

  final String? message;
  final int? statusCode;
  final Map<String, List<String>>? errors;

  @override
  // TODO: implement props
  List<dynamic> get props => [message, statusCode];
}

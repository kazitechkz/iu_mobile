import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../common/models/response_data.dart';
import '../services/injection_main.container.dart';

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
        statusCode: statusCode,
        message: message,
        errors: errorsStr != null ? Errors.fromJson(errorsStr) : null);
  }

  @override
  // TODO: implement props
  List<dynamic> get props => [message, statusCode, errors];
}

class AuthException extends Equatable implements Exception {
  final String token;
  final String role;
  final dynamic user;
  final bool isFirst;
  final String redirectURL;
  final int errorCode;
  final dynamic errorDetails;

  const AuthException({
    required this.token,
    required this.role,
    required this.user,
    required this.isFirst,
    required this.redirectURL,
    required this.errorCode,
    required this.errorDetails,
  });

  @override
  String toString() {
    return 'ApiException(token: $token, role: $role, user: $user, isFirst: $isFirst, redirectURL: $redirectURL, errorCode: $errorCode, errorDetails: $errorDetails)';
  }

  @override
  List<Object> get props =>
      [token, role, user, isFirst, redirectURL, errorCode, errorDetails];
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

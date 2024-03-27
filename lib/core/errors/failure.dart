import 'package:equatable/equatable.dart';
import '../common/models/response_data.dart';
import 'exception.dart';

abstract class Failure extends Equatable{

  const Failure({this.message, this.statusCode, this.errors});

  final String? message;
  final int? statusCode;
  final Errors? errors;
}

class ApiFailure extends Failure{
  ApiFailure({super.message, super.statusCode,super.errors});

  ApiFailure.fromException(ApiException exception)
      : this(message: exception.message,statusCode: exception.statusCode, errors: exception.errors);

  @override
  List<dynamic> get props => [message,statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({super.message, super.statusCode, super.errors});

  CacheFailure.fromException(CacheException exception)
      : this(message: exception.message,
      statusCode: exception.statusCode,
      errors: exception.errors as Errors);

  @override
  List<dynamic> get props => [message, statusCode];
}


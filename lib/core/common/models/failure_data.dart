import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/errors/failure.dart';

class FailureData{
  int? statusCode;
  String? message;
  Errors? errors;
  FailureData({this.statusCode, this.message, this.errors,});

  factory FailureData.fromApiFailure(Failure e){

    return FailureData(statusCode: e.statusCode,message:e.message,errors: e.errors);
  }

}
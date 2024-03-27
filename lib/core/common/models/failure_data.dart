import 'package:iu/core/common/models/response_data.dart';

class FailureData{
  int? statusCode;
  String? message;
  Errors? errors;
  FailureData({this.statusCode, this.message, this.errors,});

}
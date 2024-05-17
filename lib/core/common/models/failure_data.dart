import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/errors/failure.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../services/injection_main.container.dart';

class FailureData extends Equatable {
  final int? statusCode;
  final String? message;
  final Errors? errors;

  const FailureData({this.statusCode, this.message, this.errors});

  factory FailureData.fromApiFailure(Failure e) {
    return FailureData(
        statusCode: e.statusCode, message: e.message, errors: e.errors);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, message, errors];
}

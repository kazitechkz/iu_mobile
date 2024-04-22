import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pagination_parameter.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_entity.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_student_entity.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_unt_entity.dart';
import 'package:iu/features/attempt_setting/domain/interfaces/attempt_setting_interface.dart';
import 'package:iu/features/attempt_setting/domain/parameters/create_attempt_setting_params.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../datasources/attempt_setting_datasource.dart';

class AttemptSettingRepository implements AttemptSettingInterface {
  final AttemptSettingDatasourceInterface attemptSettingDatasourceInterface;
  AttemptSettingRepository(this.attemptSettingDatasourceInterface);

  @override
  ResultFuture<AttemptSettingEntity> createAttemptSetting(CreateAttemptSettingParams params) async {
    try {
      final result = await attemptSettingDatasourceInterface.createAttemptSetting(params);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<PaginationData<List<AttemptSettingStudentEntity>>> myAttemptSettingSingle(PaginationParameter parameter) async {
    try {
      final result = await attemptSettingDatasourceInterface.myAttemptSettingSingle(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<PaginationData<List<AttemptSettingUntEntity>>> myAttemptSettingUnt(PaginationParameter parameter) async {
    try {
      final result = await attemptSettingDatasourceInterface.myAttemptSettingUnt(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }
}
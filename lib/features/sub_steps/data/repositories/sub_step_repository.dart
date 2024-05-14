import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_steps/data/datasources/sub_step_datasource.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_exam_entity.dart';
import 'package:iu/features/sub_steps/domain/interface/sub_step_interface.dart';
import 'package:iu/features/sub_steps/domain/parameters/pass_sub_step_exam_params.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/sub_step_result_exam_entity.dart';

class SubStepRepository extends SubStepInterface {
  final SubStepDataSourceInterface stepDataSourceInterface;
  SubStepRepository(this.stepDataSourceInterface);
  @override
  ResultFuture<List<SubStepEntity>> getSubSteps(String stepID) async {
    try {
      final result = await stepDataSourceInterface.getSubSteps(stepID);
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
  ResultFuture<SubStepEntity> getSubStepDetail(String subStepID) async {
    try {
      final result = await stepDataSourceInterface.getSubStepDetail(subStepID);
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
  ResultFuture<List<SubStepExamEntity>> getSubStepExams(SubStepExamParameters params) async {
    try {
      final result = await stepDataSourceInterface.getSubStepExams(params);
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
  ResultFuture<int> passSubStepExam(List<PassSubStepExamParams> params) async {
    try {
      final result = await stepDataSourceInterface.passSubStepExam(params);
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
  ResultFuture<bool> checkExamResult(SubStepExamParameters params) async {
    try {
      final result = await stepDataSourceInterface.checkExamResult(params);
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
  ResultFuture<SubStepExamResultEntity> getSubStepExamResult(SubStepExamParameters params) async {
    try {
      final result = await stepDataSourceInterface.getSubStepExamResult(params);
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
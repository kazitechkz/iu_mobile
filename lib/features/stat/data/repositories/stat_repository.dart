import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/stat/data/datasources/stat_datasource.dart';
import 'package:iu/features/stat/domain/entities/full_stat_entity.dart';
import 'package:iu/features/stat/domain/entities/result_by_attempt_id_entity.dart';
import 'package:iu/features/stat/domain/entities/stat_by_attempt_id_entity.dart';
import 'package:iu/features/stat/domain/entities/stat_by_subject_id_entity.dart';
import 'package:iu/features/stat/domain/interface/stat_interface.dart';
import 'package:iu/features/stat/domain/parameters/full_stat_parameter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class StatRepository implements StatInterface {
  final StatDataSourceInterface _statDataSourceInterface;

  const StatRepository(this._statDataSourceInterface);

  @override
  ResultFuture<FullStatEntity> fullStat(FullStatParameter parameter) async {
    try {
      final result = await _statDataSourceInterface.fullStat(parameter);
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
  ResultFuture<ResultByAttemptIdEntity> resultByAttemptId(int parameter) async {
    try {
      final result =
          await _statDataSourceInterface.resultByAttemptId(parameter);
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
  ResultFuture<StatByAttemptIdEntity> statByAttemptId(int parameter) async {
    try {
      final result = await _statDataSourceInterface.statByAttemptId(parameter);
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
  ResultFuture<StatBySubjectIdEntity> statBySubjectId(int parameter) async {
    try {
      final result = await _statDataSourceInterface.statBySubjectId(parameter);
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

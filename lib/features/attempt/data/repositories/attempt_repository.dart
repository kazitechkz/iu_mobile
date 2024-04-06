import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/data/datasources/attempt_datasource.dart';
import 'package:iu/features/attempt/domain/entities/answer_result_entity.dart';
import 'package:iu/features/attempt/domain/entities/answered_result_entity.dart';
import 'package:iu/features/attempt/domain/entities/attempt_common_entity.dart';
import 'package:iu/features/attempt/domain/entities/attempt_entity.dart';
import 'package:iu/features/attempt/domain/entities/finish_attempt_entity.dart';
import 'package:iu/features/attempt/domain/entities/get_stat_entity.dart';
import 'package:iu/features/attempt/domain/entities/unt_stat_entity.dart';
import 'package:iu/features/attempt/domain/interface/attempt_interface.dart';
import 'package:iu/features/attempt/domain/parameters/all_attempts_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/answered_result_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/create_attempt_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/save_question_parameter.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/attempt_type_entity.dart';

class AttemptRepository implements AttemptInterface {
  final AttemptDataSourceInterface attemptDataSourceInterface;
  const AttemptRepository(this.attemptDataSourceInterface);

  @override
  ResultFuture<List<AttemptTypeEntity>> allAttemptTypes() async {
    try {
      final result = await attemptDataSourceInterface.allAttemptTypesDS();
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
  ResultFuture<PaginationData<List<AttemptEntity>>> allAttempts(
      AllAttemptsParameter allAttemptsParameter) async {
    try {
      final result =
          await attemptDataSourceInterface.allAttemptsDS(allAttemptsParameter);
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
  ResultFuture<AnswerResultEntity> answer(
      AnswerParameter answerParameter) async {
    try {
      final result = await attemptDataSourceInterface.answerDS(answerParameter);
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
  ResultFuture<AnsweredResultEntity> answeredResult(
      AnsweredResultParameter answeredParameter) async {
    try {
      final result =
          await attemptDataSourceInterface.answeredResultDS(answeredParameter);
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
  ResultFuture<int> createAttempt(
      CreateAttemptParameter createAttemptParameter) async {
    try {
      final result = await attemptDataSourceInterface
          .createAttemptDS(createAttemptParameter);
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
  ResultFuture<FinishAttemptEntity> finishAttempt(int attemptId) async {
    try {
      final result =
          await attemptDataSourceInterface.finishAttemptDS(attemptId);
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
  ResultFuture<AttemptCommonEntity> getAttempt(int attemptId) async {
    try {
      final result = await attemptDataSourceInterface.getAttemptDS(attemptId);
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
  ResultFuture<AttemptEntity> getAttemptByPromoCode(String promoCode) async {
    try {
      final result =
          await attemptDataSourceInterface.getAttemptByPromoCodeDS(promoCode);
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
  ResultFuture<GetStatEntity> getAttemptStat(int attemptId) async {
    try {
      final result =
          await attemptDataSourceInterface.getAttemptStatDS(attemptId);
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
  ResultFuture<UntStatEntity> getUNTStat() async {
    try {
      final result = await attemptDataSourceInterface.getUNTStatDS();
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
  ResultFuture<bool> saveQuestion(SaveQuestionParameter parameter) async {
    try {
      final result = await attemptDataSourceInterface.saveQuestionDS(parameter);
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

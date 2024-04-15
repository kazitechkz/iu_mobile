import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/battle/data/datasources/battle_datasource.dart';
import 'package:iu/features/battle/domain/entities/battle_answer_result_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';
import 'package:iu/features/battle/domain/entities/finish_battle_result_entity.dart';
import 'package:iu/features/battle/domain/entities/get_battle_stats_entity.dart';
import 'package:iu/features/battle/domain/entities/given_battle_question_entity.dart';
import 'package:iu/features/battle/domain/entities/propose_subject_for_battle_entity.dart';
import 'package:iu/features/battle/domain/interface/battle_interface.dart';
import 'package:iu/features/battle/domain/parameters/answer_battle_question_parameter.dart';
import 'package:iu/features/battle/domain/parameters/create_battle_parameter.dart';
import 'package:iu/features/battle/domain/parameters/create_battle_step_parameter.dart';
import 'package:iu/features/battle/domain/parameters/get_active_battles_parameter.dart';
import 'package:iu/features/battle/domain/parameters/get_battle_history_parameter.dart';
import 'package:iu/features/battle/domain/parameters/join_to_battle_parameter.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class BattleRepository implements BattleInterface{
  final BattleDataSourceInterface battleDataSourceInterface;
  const BattleRepository(this.battleDataSourceInterface);

  @override
  ResultFuture<BattleAnswerResultEntity> answerBattleQuestion(AnswerBattleQuestionParameter parameter) async {
    try {
      final result = await this.battleDataSourceInterface.answerBattleQuestionDS(parameter);
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
  ResultFuture<BattleEntity> createBattle(CreateBattleParameter parameter) async {
    try {
      final result = await this.battleDataSourceInterface.createBattleDS(parameter);
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
  ResultFuture<GivenBattleQuestionEntity> createBattleStep(CreateBattleStepParameter parameter) async {
    try {
      final result = await this.battleDataSourceInterface.createBattleStepDS(parameter);
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
  ResultFuture<FinishBattleResultEntity> finishBattleResult(int parameter) async {
    try {
      final result = await this.battleDataSourceInterface.finishBattleResultDS(parameter);
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
  ResultFuture<PaginationData<List<BattleEntity>>> getActiveBattles(GetActiveBattlesParameter parameter) async {
    try {
      final result = await this.battleDataSourceInterface.getActiveBattlesDS(parameter);
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
  ResultFuture<BattleEntity> getBattleByPromo(String promoCode) async {
    try {
      final result = await this.battleDataSourceInterface.getBattleByPromoDS(promoCode);
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
  ResultFuture<PaginationData<List<BattleEntity>>> getBattleHistory(GetBattleHistoryParameter parameter) async {
    try {
      final result = await this.battleDataSourceInterface.getBattleHistoryDS(parameter);
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
  ResultFuture<GetBattleStatsEntity> getBattleStats() async {
    try {
      final result = await this.battleDataSourceInterface.getBattleStatsDS();
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
  ResultFuture<GivenBattleQuestionEntity> getBattleStep(int parameter) async {
    try {
      final result = await this.battleDataSourceInterface.getBattleStepDS(parameter);
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
  ResultFuture<List<BattleStepQuestionEntity>> getBattleStepQuestions(String parameter) async {
    try {
      final result = await this.battleDataSourceInterface.getBattleStepQuestionsDS(parameter);
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
  ResultFuture<ProposeSubjectForBattleEntity> getBattleSubjects(int parameter) async {
    try {
      final result = await this.battleDataSourceInterface.getBattleSubjectsDS(parameter);
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
  ResultFuture<BattleEntity> joinToBattle(JoinToBattleParameter parameter) async {
    try {
      final result = await this.battleDataSourceInterface.joinToBattleDS(parameter);
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
  ResultFuture<List<BattleEntity>> myActiveBattles() async {
    try {
      final result = await this.battleDataSourceInterface.myActiveBattlesDS();
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
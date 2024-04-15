import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/battle/domain/entities/battle_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';
import 'package:iu/features/battle/domain/entities/finish_battle_result_entity.dart';
import 'package:iu/features/battle/domain/entities/get_battle_stats_entity.dart';
import 'package:iu/features/battle/domain/entities/given_battle_question_entity.dart';
import 'package:iu/features/battle/domain/entities/propose_subject_for_battle_entity.dart';
import 'package:iu/features/battle/domain/parameters/answer_battle_question_parameter.dart';
import 'package:iu/features/battle/domain/parameters/create_battle_parameter.dart';
import 'package:iu/features/battle/domain/parameters/get_active_battles_parameter.dart';
import 'package:iu/features/battle/domain/parameters/get_battle_history_parameter.dart';
import 'package:iu/features/battle/domain/parameters/join_to_battle_parameter.dart';

import '../entities/battle_answer_result_entity.dart';
import '../parameters/create_battle_step_parameter.dart';

abstract class BattleInterface{
  ResultFuture<BattleAnswerResultEntity> answerBattleQuestion(AnswerBattleQuestionParameter parameter);
  ResultFuture<BattleEntity> createBattle(CreateBattleParameter parameter);
  ResultFuture<GivenBattleQuestionEntity> createBattleStep(CreateBattleStepParameter parameter);
  ResultFuture<FinishBattleResultEntity> finishBattleResult(int parameter);
  ResultFuture<PaginationData<List<BattleEntity>>> getActiveBattles(GetActiveBattlesParameter parameter);
  ResultFuture<BattleEntity> getBattleByPromo(String promoCode);
  ResultFuture<PaginationData<List<BattleEntity>>> getBattleHistory(GetBattleHistoryParameter parameter);
  ResultFuture<GetBattleStatsEntity> getBattleStats();
  ResultFuture<GivenBattleQuestionEntity> getBattleStep(int parameter);
  ResultFuture<List<BattleStepQuestionEntity>> getBattleStepQuestions(String parameter);
  ResultFuture<ProposeSubjectForBattleEntity> getBattleSubjects(int parameter);
  ResultFuture<BattleEntity> joinToBattle(JoinToBattleParameter parameter);
  ResultFuture<List<BattleEntity>> myActiveBattles();
}
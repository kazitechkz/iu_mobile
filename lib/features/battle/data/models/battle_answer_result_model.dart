import 'package:equatable/equatable.dart';
import 'package:iu/features/battle/data/models/battle_step_question_model.dart';
import 'package:iu/features/battle/domain/entities/battle_answer_result_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';

import '../../../../core/utils/typedef.dart';

class BattleAnswerResultModel extends BattleAnswerResultEntity {
  const BattleAnswerResultModel(
      {required super.isRight,
      required super.point,
      required super.questionId,
      required List<BattleStepQuestionModel> super.result,
      required super.battleId,
      required super.battlePromoCode,
      required super.battleStepId,
      required super.givenAnswer,
      required super.correctAnswer,
      required super.isFinished,
      super.nextStepId});

  BattleAnswerResultModel.fromMap(DataMap map)
      : this(
          isRight: map["is_right"],
          point: map["point"],
          questionId: int.parse(map["question_id"]),
          result: BattleStepQuestionModel.fromMapList(
              map["result"].cast<Map<String, dynamic>>()),
          battleId: map["battle_id"],
          battlePromoCode: map["battle_promo_code"],
          battleStepId: map["battle_step_id"],
          givenAnswer: map["given_answer"],
          correctAnswer: map["correct_answer"],
          isFinished: map["is_finished"],
          nextStepId: map["next_step_id"],
        );

  factory BattleAnswerResultModel.fromJson(Map<String, dynamic> json) {
    return BattleAnswerResultModel.fromMap(json);
  }

  static List<BattleAnswerResultModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => BattleAnswerResultModel.fromMap(map)).toList();
  }
}

import 'package:iu/features/attempt/data/models/question_model.dart';
import 'package:iu/features/battle/data/models/battle_step_question_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/given_battle_question_entity.dart';

class GivenBattleQuestionModel extends GivenBattleQuestionEntity {
  const GivenBattleQuestionModel(
      {required super.battleId,
      required super.battleStepId,
      required super.battlePromoCode,
      required super.answeredQuestions,
      required super.timeLeftSeconds,
      required List<QuestionModel> super.questions,
      required List<BattleStepQuestionModel> super.result});

  GivenBattleQuestionModel.fromMap(DataMap map)
      : this(
          battleId: map["battle_id"],
          battleStepId: map["battle_step_id"],
          battlePromoCode: map["battle_promo_code"],
          answeredQuestions: map["answered_questions"].cast<int>(),
          timeLeftSeconds: map["time_left_seconds"],
          questions: map["questions"] != null
              ? QuestionModel.fromMapList(
                  map["questions"].cast<Map<String, dynamic>>())
              : [],
          result: map["result"] != null
              ? BattleStepQuestionModel.fromMapList(
                  map["result"].cast<Map<String, dynamic>>())
              : [],
        );

  factory GivenBattleQuestionModel.fromJson(Map<String, dynamic> json) {
    return GivenBattleQuestionModel.fromMap(json);
  }

  static List<GivenBattleQuestionModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GivenBattleQuestionModel.fromMap(map)).toList();
  }
}

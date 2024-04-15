import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/attempt/data/models/question_model.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';
import 'package:iu/features/battle/data/models/battle_step_model.dart';
import 'package:iu/features/battle/domain/entities/battle_step_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';

import '../../../../core/utils/typedef.dart';

class BattleStepQuestionModel extends BattleStepQuestionEntity {
  const BattleStepQuestionModel(
      {required super.id,
      required super.stepId,
      required super.questionId,
      required super.userId,
      super.answer,
      super.rightAnswer,
      required super.isRight,
      required super.isAnswered,
      required super.point,
      super.createdAt,
      super.updatedAt,
      OrdinaryUserModel? super.user,
      BattleStepModel? super.battleStep,
      QuestionModel? super.question});

  BattleStepQuestionModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          stepId: map["step_id"],
          questionId: map["question_id"],
          userId: map["user_id"],
          answer: map["answer"],
          rightAnswer: map["right_answer"],
          isRight: map["is_right"],
          isAnswered: map["is_answered"],
          point: map["point"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          user: map["user"] != null
              ? OrdinaryUserModel.fromJson(map["user"])
              : null,
          battleStep: map["battle_step"] != null
              ? BattleStepModel.fromJson(map["battle_step"])
              : null,
          question: map["question"] != null
              ? QuestionModel.fromJson(map["question"])
              : null,
        );

  factory BattleStepQuestionModel.fromJson(Map<String, dynamic> json) {
    return BattleStepQuestionModel.fromMap(json);
  }

  static List<BattleStepQuestionModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => BattleStepQuestionModel.fromMap(map)).toList();
  }
}

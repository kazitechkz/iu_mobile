import 'package:equatable/equatable.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';

class BattleAnswerResultEntity extends Equatable {

  final bool isRight;
  final int point;
  final int questionId;
  final List<BattleStepQuestionEntity> result;
  final int battleId;
  final String battlePromoCode;
  final int battleStepId;
  final String givenAnswer;
  final String correctAnswer;
  final bool isFinished;
  final int? nextStepId;

  const BattleAnswerResultEntity(
      {
        required this.isRight,
        required this.point,
        required this.questionId,
        required this.result,
        required this.battleId,
        required this.battlePromoCode,
        required this.battleStepId,
        required this.givenAnswer,
        required this.correctAnswer,
        required this.isFinished,
        this.nextStepId
      });

  @override
  List<Object?> get props => [
        isRight,
        point,
        questionId,
        result,
        battleId,
        battlePromoCode,
        battleStepId,
        givenAnswer,
        correctAnswer,
        isFinished,
        nextStepId
      ];
}

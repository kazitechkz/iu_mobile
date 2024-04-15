import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';

class GivenBattleQuestionEntity extends Equatable{
  final int battleId;
  final int battleStepId;
  final String battlePromoCode;
  final List<int> answeredQuestions;
  final int timeLeftSeconds;
  final List<QuestionEntity> questions;
  final List<BattleStepQuestionEntity> result;

  const GivenBattleQuestionEntity({
    required this.battleId,
    required this.battleStepId,
    required this.battlePromoCode,
    required this.answeredQuestions,
    required this.timeLeftSeconds,
    required this.questions,
    required this.result
});

  @override
  List<Object?> get props => [battleId,battleStepId,battlePromoCode,answeredQuestions,timeLeftSeconds,questions,result];


}
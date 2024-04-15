import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_entity.dart';

class BattleStepQuestionEntity extends Equatable {
  final int id;
  final int stepId;
  final int questionId;
  final int userId;
  final String? answer;
  final String? rightAnswer;
  final bool isRight;
  final bool isAnswered;
  final int point;
  final String? createdAt;
  final String? updatedAt;
  final OrdinaryUserEntity? user;
  final BattleStepEntity? battleStep;
  final QuestionEntity? question;

  const BattleStepQuestionEntity(
      {required this.id,
      required this.stepId,
      required this.questionId,
      required this.userId,
      this.answer,
      this.rightAnswer,
      required this.isRight,
      required this.isAnswered,
      required this.point,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.battleStep,
      this.question});


  @override
  List<Object?> get props =>
      [id, stepId, questionId, userId, isRight, isAnswered, point];
}

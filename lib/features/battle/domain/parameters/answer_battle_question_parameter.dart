import '../../../../core/utils/typedef.dart';

class AnswerBattleQuestionParameter{
  final int battle_step_id;
  final String answer;
  final int question_id;

  const AnswerBattleQuestionParameter({
    required this.battle_step_id, required this.answer, required this.question_id
  });

  DataMap toMap() {
    return {
      "battle_step_id": battle_step_id.toString(),
      "answer": answer.toString(),
      "question_id": question_id.toString(),
    };
  }

}
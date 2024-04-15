import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/battle/domain/interface/battle_interface.dart';

import '../entities/battle_answer_result_entity.dart';
import '../parameters/answer_battle_question_parameter.dart';

class AnswerBattleQuestionCase extends UseCaseWithParams<BattleAnswerResultEntity,AnswerBattleQuestionParameter>{
  final BattleInterface _battleInterface;
  const AnswerBattleQuestionCase(this._battleInterface);

  @override
  ResultFuture<BattleAnswerResultEntity> call(AnswerBattleQuestionParameter params) {
    return _battleInterface.answerBattleQuestion(params);
  }


}
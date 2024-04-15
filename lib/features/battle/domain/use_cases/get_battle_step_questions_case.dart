import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/battle_step_question_entity.dart';
import '../interface/battle_interface.dart';

class GetBattleStepQuestionsCase
    extends UseCaseWithParams<List<BattleStepQuestionEntity>, String> {
  final BattleInterface _battleInterface;
  const GetBattleStepQuestionsCase(this._battleInterface);

  @override
  ResultFuture<List<BattleStepQuestionEntity>> call(String params) {
    return _battleInterface.getBattleStepQuestions(params);
  }
}

import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/battle_entity.dart';
import '../entities/given_battle_question_entity.dart';
import '../interface/battle_interface.dart';
import '../parameters/get_battle_history_parameter.dart';

class GetBattleStepCase extends UseCaseWithParams<GivenBattleQuestionEntity,int>{
  final BattleInterface _battleInterface;
  const GetBattleStepCase(this._battleInterface);

  @override
  ResultFuture<GivenBattleQuestionEntity> call(int params) {
    return _battleInterface.getBattleStep(params);
  }
}
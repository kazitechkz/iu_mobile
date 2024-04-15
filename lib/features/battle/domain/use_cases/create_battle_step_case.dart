import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/battle/domain/interface/battle_interface.dart';
import '../entities/given_battle_question_entity.dart';
import '../parameters/create_battle_step_parameter.dart';


class CreateBattleStepCase extends UseCaseWithParams<GivenBattleQuestionEntity,CreateBattleStepParameter>{
  final BattleInterface _battleInterface;
  const CreateBattleStepCase(this._battleInterface);

  @override
  ResultFuture<GivenBattleQuestionEntity> call(CreateBattleStepParameter params) {
    return _battleInterface.createBattleStep(params);
  }
}
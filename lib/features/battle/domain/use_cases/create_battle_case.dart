import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/battle/domain/interface/battle_interface.dart';

import '../entities/battle_answer_result_entity.dart';
import '../entities/battle_entity.dart';
import '../parameters/answer_battle_question_parameter.dart';
import '../parameters/create_battle_parameter.dart';

class CreateBattleCase extends UseCaseWithParams<BattleEntity,CreateBattleParameter>{
  final BattleInterface _battleInterface;
  const CreateBattleCase(this._battleInterface);

  @override
  ResultFuture<BattleEntity> call(CreateBattleParameter params) {
    return _battleInterface.createBattle(params);
  }
}
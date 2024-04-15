import 'package:iu/core/utils/typedef.dart';

import '../../../../core/usecases/use_case.dart';
import '../entities/battle_entity.dart';
import '../interface/battle_interface.dart';
import '../parameters/join_to_battle_parameter.dart';

class JoinToBattleCase
    extends UseCaseWithParams<BattleEntity, JoinToBattleParameter> {
  final BattleInterface _battleInterface;
  const JoinToBattleCase(this._battleInterface);

  @override
  ResultFuture<BattleEntity> call(JoinToBattleParameter params) {
    return this._battleInterface.joinToBattle(params);
  }
}

import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/battle_entity.dart';
import '../interface/battle_interface.dart';

class MyActiveBattlesCase extends UseCaseWithoutParams<List<BattleEntity>> {
  final BattleInterface _battleInterface;
  const MyActiveBattlesCase(this._battleInterface);

  @override
  ResultFuture<List<BattleEntity>> call() {
    return this._battleInterface.myActiveBattles();
  }
}

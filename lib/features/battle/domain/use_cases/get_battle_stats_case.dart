import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_battle_stats_entity.dart';
import '../interface/battle_interface.dart';

class GetBattleStatsCase extends UseCaseWithoutParams<GetBattleStatsEntity> {
  final BattleInterface _battleInterface;
  const GetBattleStatsCase(this._battleInterface);
  @override
  ResultFuture<GetBattleStatsEntity> call() {
    return this._battleInterface.getBattleStats();
  }
}

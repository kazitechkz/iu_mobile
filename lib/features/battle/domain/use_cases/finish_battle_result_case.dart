import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/finish_battle_result_entity.dart';
import '../interface/battle_interface.dart';

class FinishBattleResultCase extends UseCaseWithParams<FinishBattleResultEntity,int>{
  final BattleInterface _battleInterface;
  const FinishBattleResultCase(this._battleInterface);

  @override
  ResultFuture<FinishBattleResultEntity> call(int params) {
    return _battleInterface.finishBattleResult(params);
  }
}
import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/battle_entity.dart';
import '../interface/battle_interface.dart';

class GetBattleByPromoCase extends UseCaseWithParams<BattleEntity,String>{
  final BattleInterface _battleInterface;
  const GetBattleByPromoCase(this._battleInterface);

  @override
  ResultFuture<BattleEntity> call(String params) {
    return _battleInterface.getBattleByPromo(params);
  }
}
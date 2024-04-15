import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/battle_entity.dart';
import '../interface/battle_interface.dart';
import '../parameters/get_active_battles_parameter.dart';

class GetActiveBattlesCase extends UseCaseWithParams<PaginationData<List<BattleEntity>>,GetActiveBattlesParameter>{
  final BattleInterface _battleInterface;
  const GetActiveBattlesCase(this._battleInterface);

  @override
  ResultFuture<PaginationData<List<BattleEntity>>> call(GetActiveBattlesParameter params) {
    return _battleInterface.getActiveBattles(params);
  }
}
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/battle_entity.dart';
import '../interface/battle_interface.dart';
import '../parameters/get_battle_history_parameter.dart';

class GetBattleHistoryCase extends UseCaseWithParams<PaginationData<List<BattleEntity>>,GetBattleHistoryParameter>{
  final BattleInterface _battleInterface;
  const GetBattleHistoryCase(this._battleInterface);

  @override
  ResultFuture<PaginationData<List<BattleEntity>>> call(GetBattleHistoryParameter params) {
    return _battleInterface.getBattleHistory(params);
  }
}
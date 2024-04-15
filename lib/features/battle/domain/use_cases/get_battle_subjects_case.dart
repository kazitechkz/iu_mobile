import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/propose_subject_for_battle_entity.dart';
import '../interface/battle_interface.dart';

class GetBattleSubjectsCase
    extends UseCaseWithParams<ProposeSubjectForBattleEntity, int> {
  final BattleInterface _battleInterface;
  const GetBattleSubjectsCase(this._battleInterface);

  @override
  ResultFuture<ProposeSubjectForBattleEntity> call(int params) {
    return _battleInterface.getBattleSubjects(params);
  }
}

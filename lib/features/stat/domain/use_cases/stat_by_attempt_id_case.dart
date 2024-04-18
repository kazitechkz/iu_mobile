import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../entities/stat_by_attempt_id_entity.dart';
import '../interface/stat_interface.dart';

class StatByAttemptIdCase extends UseCaseWithParams<StatByAttemptIdEntity,int>{
  final StatInterface _statInterface;
  const StatByAttemptIdCase(this._statInterface);
  @override
  ResultFuture<StatByAttemptIdEntity> call(int params) {
    return this._statInterface.statByAttemptId(params);
  }

}
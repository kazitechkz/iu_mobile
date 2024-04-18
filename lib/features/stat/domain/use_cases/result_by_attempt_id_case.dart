import 'package:iu/core/utils/typedef.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/result_by_attempt_id_entity.dart';
import '../interface/stat_interface.dart';

class ResultByAttemptIdCase extends UseCaseWithParams<ResultByAttemptIdEntity,int>{
  final StatInterface _statInterface;
  const ResultByAttemptIdCase(this._statInterface);
  @override
  ResultFuture<ResultByAttemptIdEntity> call(int params) {
    return this._statInterface.resultByAttemptId(params);
  }

}
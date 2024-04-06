import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/unt_stat_entity.dart';

import '../interface/attempt_interface.dart';

class GetUntStatCase extends UseCaseWithoutParams<UntStatEntity> {
  final AttemptInterface _attemptInterface;
  const GetUntStatCase(this._attemptInterface);

  @override
  ResultFuture<UntStatEntity> call() {
    return this._attemptInterface.getUNTStat();
  }
}

import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/get_stat_entity.dart';

import '../interface/attempt_interface.dart';

class GetAttemptStatCase extends UseCaseWithParams<GetStatEntity, int> {
  final AttemptInterface _attemptInterface;
  const GetAttemptStatCase(this._attemptInterface);

  @override
  ResultFuture<GetStatEntity> call(int params) {
    return this._attemptInterface.getAttemptStat(params);
  }
}

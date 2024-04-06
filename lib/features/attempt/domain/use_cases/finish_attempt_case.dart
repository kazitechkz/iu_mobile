import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/finish_attempt_entity.dart';

import '../interface/attempt_interface.dart';

class FinishAttemptCase extends UseCaseWithParams<FinishAttemptEntity, int> {
  final AttemptInterface _attemptInterface;
  const FinishAttemptCase(this._attemptInterface);

  @override
  ResultFuture<FinishAttemptEntity> call(int params) {
    return this._attemptInterface.finishAttempt(params);
  }
}

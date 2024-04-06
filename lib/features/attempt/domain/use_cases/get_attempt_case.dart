import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/attempt_common_entity.dart';

import '../interface/attempt_interface.dart';

class GetAttemptCase extends UseCaseWithParams<AttemptCommonEntity, int> {
  final AttemptInterface _attemptInterface;
  const GetAttemptCase(this._attemptInterface);

  @override
  ResultFuture<AttemptCommonEntity> call(int params) {
    return this._attemptInterface.getAttempt(params);
  }
}

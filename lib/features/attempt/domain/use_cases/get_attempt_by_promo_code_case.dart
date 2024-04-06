import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/attempt_entity.dart';

import '../interface/attempt_interface.dart';

class GetAttemptByPromoCodeCase
    extends UseCaseWithParams<AttemptEntity, String> {
  final AttemptInterface _attemptInterface;
  const GetAttemptByPromoCodeCase(this._attemptInterface);

  @override
  ResultFuture<AttemptEntity> call(String params) {
    return this._attemptInterface.getAttemptByPromoCode(params);
  }
}

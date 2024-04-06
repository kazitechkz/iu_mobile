import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/parameters/create_attempt_parameter.dart';

import '../interface/attempt_interface.dart';

class CreateAttemptCase extends UseCaseWithParams<int, CreateAttemptParameter> {
  final AttemptInterface _attemptInterface;
  const CreateAttemptCase(this._attemptInterface);

  @override
  ResultFuture<int> call(CreateAttemptParameter params) {
    return this._attemptInterface.createAttempt(params);
  }
}

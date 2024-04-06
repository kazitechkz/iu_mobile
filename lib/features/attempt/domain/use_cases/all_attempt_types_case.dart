import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/interface/attempt_interface.dart';

import '../entities/attempt_type_entity.dart';

class AllAttemptTypesCase
    extends UseCaseWithoutParams<List<AttemptTypeEntity>> {
  final AttemptInterface _attemptInterface;
  const AllAttemptTypesCase(this._attemptInterface);

  @override
  ResultFuture<List<AttemptTypeEntity>> call() {
    return this._attemptInterface.allAttemptTypes();
  }
}

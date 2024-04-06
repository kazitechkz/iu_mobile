import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/interface/attempt_interface.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/attempt_entity.dart';
import '../parameters/all_attempts_parameter.dart';

class AllAttemptsCase extends UseCaseWithParams<
    PaginationData<List<AttemptEntity>>, AllAttemptsParameter> {
  final AttemptInterface _attemptInterface;
  const AllAttemptsCase(this._attemptInterface);

  @override
  ResultFuture<PaginationData<List<AttemptEntity>>> call(params) {
    return this._attemptInterface.allAttempts(params);
  }
}

import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/answered_result_entity.dart';
import 'package:iu/features/attempt/domain/interface/attempt_interface.dart';
import 'package:iu/features/attempt/domain/parameters/answered_result_parameter.dart';

class AnswerResultCase
    extends UseCaseWithParams<AnsweredResultEntity, AnsweredResultParameter> {
  final AttemptInterface _attemptInterface;
  const AnswerResultCase(this._attemptInterface);

  @override
  ResultFuture<AnsweredResultEntity> call(AnsweredResultParameter params) {
    return this._attemptInterface.answeredResult(params);
  }
}

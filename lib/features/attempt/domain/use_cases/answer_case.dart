import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/answer_result_entity.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';

import '../interface/attempt_interface.dart';

class AnswerCase
    extends UseCaseWithParams<AnswerResultEntity, AnswerParameter> {
  final AttemptInterface _attemptInterface;
  const AnswerCase(this._attemptInterface);

  @override
  ResultFuture<AnswerResultEntity> call(AnswerParameter params) {
    return this._attemptInterface.answer(params);
  }
}

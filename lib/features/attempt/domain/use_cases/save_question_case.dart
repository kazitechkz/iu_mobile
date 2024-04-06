import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/parameters/save_question_parameter.dart';

import '../interface/attempt_interface.dart';

class SaveQuestionCase extends UseCaseWithParams<bool, SaveQuestionParameter> {
  final AttemptInterface _attemptInterface;
  const SaveQuestionCase(this._attemptInterface);

  @override
  ResultFuture<bool> call(SaveQuestionParameter params) {
    return this._attemptInterface.saveQuestion(params);
  }
}

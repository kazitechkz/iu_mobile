import 'package:iu/core/utils/typedef.dart';

import '../../../../core/usecases/use_case.dart';
import '../../../attempt/domain/entities/question_entity.dart';
import '../interface/question_interface.dart';
import '../parameters/get_my_saved_question_by_id_parameter.dart';

class GetMySavedQuestionByIdCase
    extends UseCaseWithParams<QuestionEntity, GetMySavedQuestionByIdParameter> {
  final QuestionInterface questionInterface;

  GetMySavedQuestionByIdCase(this.questionInterface);

  @override
  ResultFuture<QuestionEntity> call(GetMySavedQuestionByIdParameter params) {
    return this.questionInterface.getMySavedQuestionById(params);
  }
}

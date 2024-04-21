import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../../../attempt/domain/entities/question_entity.dart';
import '../interface/question_interface.dart';
import '../parameters/get_my_saved_questions_parameter.dart';

class GetMySavedQuestionsCase extends UseCaseWithParams<
    PaginationData<List<QuestionEntity>>, GetMySavedQuestionsParameter> {
  final QuestionInterface questionInterface;
  GetMySavedQuestionsCase(this.questionInterface);

  @override
  ResultFuture<PaginationData<List<QuestionEntity>>> call(
      GetMySavedQuestionsParameter params) {
    return this.questionInterface.getMySavedQuestions(params);
  }
}

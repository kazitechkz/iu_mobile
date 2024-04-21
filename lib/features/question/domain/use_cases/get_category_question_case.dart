import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_category_question_count_entity.dart';
import '../interface/question_interface.dart';
import '../parameters/get_category_question_count_parameter.dart';

class GetCategoryQuestionCase extends UseCaseWithParams<
    GetCategoryQuestionCountEntity, GetCategoryQuestionCountParameter> {
  final QuestionInterface questionInterface;

  GetCategoryQuestionCase(this.questionInterface);

  @override
  ResultFuture<GetCategoryQuestionCountEntity> call(
      GetCategoryQuestionCountParameter params) {
    return this.questionInterface.getCategoryQuestion(params);
  }
}

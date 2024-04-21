import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_sub_category_question_count_entity.dart';
import '../interface/question_interface.dart';
import '../parameters/get_sub_category_question_count_parameter.dart';

class GetSubCategoryQuestionCountCase extends UseCaseWithParams<
    GetSubCategoryQuestionCountEntity, GetSubCategoryQuestionCountParameter> {
  final QuestionInterface questionInterface;
  GetSubCategoryQuestionCountCase(this.questionInterface);

  @override
  ResultFuture<GetSubCategoryQuestionCountEntity> call(
      GetSubCategoryQuestionCountParameter params) {
    return this.questionInterface.getSubCategoryQuestionCount(params);
  }
}

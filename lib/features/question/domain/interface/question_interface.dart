import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';
import 'package:iu/features/question/domain/entities/get_sub_category_question_count_entity.dart';
import 'package:iu/features/question/domain/parameters/get_category_question_count_parameter.dart';
import 'package:iu/features/question/domain/parameters/get_my_saved_question_by_id_parameter.dart';
import 'package:iu/features/question/domain/parameters/get_my_saved_questions_parameter.dart';
import 'package:iu/features/question/domain/parameters/get_sub_category_question_count_parameter.dart';

import '../entities/get_category_question_count_entity.dart';

abstract class QuestionInterface {
  ResultFuture<GetCategoryQuestionCountEntity> getCategoryQuestion(
      GetCategoryQuestionCountParameter parameter);
  ResultFuture<QuestionEntity> getMySavedQuestionById(
      GetMySavedQuestionByIdParameter parameter);
  ResultFuture<PaginationData<List<QuestionEntity>>> getMySavedQuestions(
      GetMySavedQuestionsParameter parameter);
  ResultFuture<GetSubCategoryQuestionCountEntity> getSubCategoryQuestionCount(
      GetSubCategoryQuestionCountParameter parameter);
}

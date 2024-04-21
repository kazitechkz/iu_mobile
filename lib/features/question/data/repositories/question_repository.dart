import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';
import 'package:iu/features/question/data/datasources/question_datasource.dart';
import 'package:iu/features/question/domain/entities/get_category_question_count_entity.dart';
import 'package:iu/features/question/domain/entities/get_sub_category_question_count_entity.dart';
import 'package:iu/features/question/domain/interface/question_interface.dart';
import 'package:iu/features/question/domain/parameters/get_category_question_count_parameter.dart';
import 'package:iu/features/question/domain/parameters/get_my_saved_question_by_id_parameter.dart';
import 'package:iu/features/question/domain/parameters/get_my_saved_questions_parameter.dart';
import 'package:iu/features/question/domain/parameters/get_sub_category_question_count_parameter.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class QuestionRepository extends QuestionInterface {
  final QuestionDataSourceInterface questionDataSourceInterface;
  QuestionRepository(this.questionDataSourceInterface);

  @override
  ResultFuture<GetCategoryQuestionCountEntity> getCategoryQuestion(
      GetCategoryQuestionCountParameter parameter) async {
    try {
      final result = await this
          .questionDataSourceInterface
          .getCategoryQuestionDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<QuestionEntity> getMySavedQuestionById(
      GetMySavedQuestionByIdParameter parameter) async {
    try {
      final result = await this
          .questionDataSourceInterface
          .getMySavedQuestionByIdDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<PaginationData<List<QuestionEntity>>> getMySavedQuestions(
      GetMySavedQuestionsParameter parameter) async {
    try {
      final result = await this
          .questionDataSourceInterface
          .getMySavedQuestionsDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<GetSubCategoryQuestionCountEntity> getSubCategoryQuestionCount(
      GetSubCategoryQuestionCountParameter parameter) async {
    try {
      final result = await this
          .questionDataSourceInterface
          .getSubCategoryQuestionCountDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }
}

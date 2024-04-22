import 'package:dio/dio.dart';
import 'package:iu/features/attempt/data/models/question_model.dart';
import 'package:iu/features/question/data/models/get_category_question_count_model.dart';
import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../../attempt/domain/entities/question_entity.dart';
import '../../domain/entities/get_category_question_count_entity.dart';
import '../../domain/entities/get_sub_category_question_count_entity.dart';
import '../../domain/parameters/get_category_question_count_parameter.dart';
import '../../domain/parameters/get_my_saved_question_by_id_parameter.dart';
import '../../domain/parameters/get_my_saved_questions_parameter.dart';
import '../../domain/parameters/get_sub_category_question_count_parameter.dart';
import '../models/get_sub_category_question_count_model.dart';

abstract class QuestionDataSourceInterface {
  Future<GetCategoryQuestionCountEntity> getCategoryQuestionDS(
      GetCategoryQuestionCountParameter parameter);

  Future<QuestionEntity> getMySavedQuestionByIdDS(
      GetMySavedQuestionByIdParameter parameter);

  Future<PaginationData<List<QuestionEntity>>> getMySavedQuestionsDS(
      GetMySavedQuestionsParameter parameter);

  Future<GetSubCategoryQuestionCountEntity> getSubCategoryQuestionCountDS(
      GetSubCategoryQuestionCountParameter parameter);
}

class QuestionDataSourceImpl implements QuestionDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<GetCategoryQuestionCountEntity> getCategoryQuestionDS(
      GetCategoryQuestionCountParameter parameter) async {
    try {
      final response = await httpUtils
          .post(ApiConstant.getCategoryQuestionCount, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = GetCategoryQuestionCountModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<QuestionEntity> getMySavedQuestionByIdDS(
      GetMySavedQuestionByIdParameter parameter) async {
    try {
      final response = await httpUtils
          .get(ApiConstant.getMySavedQuestionById + parameter.id.toString());
      final responseData = ResponseData.fromJson(response);
      final result = QuestionModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<QuestionEntity>>> getMySavedQuestionsDS(
      GetMySavedQuestionsParameter parameter) async {
    try {
      final response = await httpUtils.get(ApiConstant.getMySavedQuestions,
          data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final paginationData = PaginationData.fromMap(responseData.data);
      final data = QuestionModel.fromMapList(
          paginationData.data.cast<Map<String, dynamic>>());
      final result = PaginationData.fromType(paginationData, data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetSubCategoryQuestionCountEntity> getSubCategoryQuestionCountDS(
      GetSubCategoryQuestionCountParameter parameter) async {
    try {
      final response = await httpUtils.post(
          ApiConstant.getSubCategoryQuestionCount,
          data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result =
          GetSubCategoryQuestionCountModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

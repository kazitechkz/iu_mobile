import 'package:dio/dio.dart';
import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/get_career_quizzes_entity.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pay_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_attempt_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_entity.dart';
import 'package:iu/features/career/domain/entities/get_career_quiz_entity.dart';
import 'package:iu/features/career/domain/entities/get_career_quiz_group_list_entity.dart';
import 'package:iu/features/career/domain/parameters/finish_career_quiz_parameter.dart';
import 'package:iu/features/career/domain/parameters/get_career_quizzes_parameter.dart';
import 'package:iu/features/career/domain/parameters/my_career_attempts_parameter.dart';
import 'package:iu/features/career/domain/parameters/pay_career_parameter.dart';
import '../models/career_quiz_attempt_model.dart';
import '../models/career_quiz_model.dart';
import '../models/get_career_quiz_group_list_model.dart';
import '../models/get_career_quiz_model.dart';
import '../models/get_career_quizzes_model.dart';

abstract class CareerDataSourceInterface {
  Future<int> finishCareerDS(FinishCareerQuizParameter parameter);
  Future<GetCareerQuizEntity> getCareerQuizDS(int parameter);
  Future<GetCareerQuizGroupListEntity> getCareerQuizGroupListDS();
  Future<GetCareerQuizzesEntity> getCareerQuizzesDS(
      GetCareerQuizzesParameter parameter);
  Future<PaginationData<List<CareerQuizAttemptEntity>>> myCareerAttemptsDS(
      MyCareerAttemptsParameter parameter);
  Future<CareerQuizEntity> passCareerQuizDS(int parameter);
  Future<PayModel> payCareerDS(PayCareerParameter parameter);
  Future<CareerQuizAttemptEntity> resultCareerQuizDS(int parameter);
}

class CareerDataSourceImpl extends CareerDataSourceInterface {
  @override
  Future<int> finishCareerDS(FinishCareerQuizParameter parameter) async {
    try {
      final response = await HttpUtil()
          .post(ApiConstant.finishCareerQuiz, data: parameter.toMap());
      final responseData = ResponseData<int>.fromJson(response);
      return responseData.data as int;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetCareerQuizEntity> getCareerQuizDS(int parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getCareerQuizDetail + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = GetCareerQuizModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetCareerQuizGroupListEntity> getCareerQuizGroupListDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.getCareerQuizGroupList);
      final responseData = ResponseData.fromJson(response);
      final result = GetCareerQuizGroupListModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetCareerQuizzesEntity> getCareerQuizzesDS(
      GetCareerQuizzesParameter parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getCareerQuizzes, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = GetCareerQuizzesModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<CareerQuizAttemptEntity>>> myCareerAttemptsDS(
      MyCareerAttemptsParameter parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.myCareerAttempts, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final paginationData = PaginationData.fromMap(responseData.data);
      List<CareerQuizAttemptModel> data = CareerQuizAttemptModel.fromMapList(
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
  Future<CareerQuizEntity> passCareerQuizDS(int parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.passCareerQuiz + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      CareerQuizModel result = CareerQuizModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PayModel> payCareerDS(PayCareerParameter parameter) async {
    try {
      final response =
          await HttpUtil().post(ApiConstant.payCareer, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      PayModel result = PayModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<CareerQuizAttemptEntity> resultCareerQuizDS(int parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.resultCareerQuiz + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      CareerQuizAttemptModel result =
          CareerQuizAttemptModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

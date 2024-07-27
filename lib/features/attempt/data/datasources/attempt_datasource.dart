import 'package:dio/dio.dart';
import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/answer_result_entity.dart';
import '../../domain/entities/answered_result_entity.dart';
import '../../domain/entities/attempt_common_entity.dart';
import '../../domain/entities/attempt_entity.dart';
import '../../domain/entities/attempt_type_entity.dart';
import '../../domain/entities/finish_attempt_entity.dart';
import '../../domain/entities/get_stat_entity.dart';
import '../../domain/entities/unt_stat_entity.dart';
import '../../domain/parameters/all_attempts_parameter.dart';
import '../../domain/parameters/answer_parameter.dart';
import '../../domain/parameters/answered_result_parameter.dart';
import '../../domain/parameters/create_attempt_parameter.dart';
import '../../domain/parameters/save_question_parameter.dart';
import '../models/answer_result_model.dart';
import '../models/answered_result_model.dart';
import '../models/attempt_common_model.dart';
import '../models/attempt_model.dart';
import '../models/attempt_type_model.dart';
import '../models/finish_attempt_model.dart';
import '../models/get_stat_model.dart';
import '../models/unt_stat_model.dart';

abstract class AttemptDataSourceInterface {
  Future<PaginationData<List<AttemptEntity>>> allAttemptsDS(
      AllAttemptsParameter allAttemptsParameter);
  Future<List<AttemptTypeEntity>> allAttemptTypesDS();
  Future<AnswerResultEntity> answerDS(AnswerParameter answerParameter);
  Future<AnsweredResultEntity> answeredResultDS(
      AnsweredResultParameter answeredParameter);
  Future<int> createAttemptDS(CreateAttemptParameter createAttemptParameter);
  Future<FinishAttemptEntity> finishAttemptDS(int attemptId);
  Future<AttemptCommonEntity> getAttemptDS(int attemptId);
  Future<AttemptEntity> getAttemptByPromoCodeDS(String promoCode);
  Future<GetStatEntity> getAttemptStatDS(int attemptId);
  Future<UntStatEntity> getUNTStatDS();
  Future<bool> saveQuestionDS(SaveQuestionParameter parameter);
}

class AttemptDataSourceImpl extends AttemptDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<List<AttemptTypeEntity>> allAttemptTypesDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.allAttemptTypes);
      final responseData = ResponseData.fromJson(response);
      final result = AttemptTypeModel.fromMapList(
          responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<AttemptEntity>>> allAttemptsDS(
      AllAttemptsParameter allAttemptsParameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.userAttempts,
          queryParameters: allAttemptsParameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final pagination = PaginationData.fromMap(responseData.data);
      List<AttemptModel> readyData = AttemptModel.fromMapList(
          pagination.data.cast<Map<String, dynamic>>());
      PaginationData<List<AttemptModel>> paginationData =
          PaginationData<List<AttemptModel>>(
              currentPage: pagination.currentPage,
              data: readyData,
              firstPageUrl: pagination.firstPageUrl,
              from: pagination.from,
              lastPage: pagination.lastPage,
              lastPageUrl: pagination.lastPageUrl,
              links: pagination.links,
              nextPageUrl: pagination.nextPageUrl,
              path: pagination.path,
              perPage: pagination.perPage,
              prevPageUrl: pagination.prevPageUrl,
              to: pagination.to,
              total: pagination.total);
      return paginationData;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<AnswerResultEntity> answerDS(AnswerParameter answerParameter) async {
    try {
      final response = await HttpUtil()
          .post(ApiConstant.answer, data: answerParameter.toMap());
      final data = ResponseData.fromJson(response);
      final result = AnswerResultModel.fromJson(data.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<AnsweredResultEntity> answeredResultDS(
      AnsweredResultParameter answeredParameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.answerResult +
          answeredParameter.attempt_subject_id.toString());
      final data = ResponseData.fromJson(response);
      if (data.data is List<dynamic>) {
        final result = AnsweredResultModel.fromMap({});
        return result;
      } else {
        final result = AnsweredResultModel.fromMap(data.data);
        return result;
      }
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<int> createAttemptDS(
      CreateAttemptParameter createAttemptParameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.createAttempt,
          data: createAttemptParameter.toMap());
      final responseData = ResponseData<int>.fromJson(response);
      return responseData.data as int;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<FinishAttemptEntity> finishAttemptDS(int attemptId) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.finishAttempt + attemptId.toString());
      final data = ResponseData.fromJson(response);
      final result = FinishAttemptModel.fromMap(data.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<AttemptEntity> getAttemptByPromoCodeDS(String promoCode) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getAttemptByPromoCode + promoCode.toString());
      final responseData = ResponseData.fromJson(response);
      return AttemptModel.fromMap(responseData.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<AttemptCommonEntity> getAttemptDS(int attemptId) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getAttemptById + attemptId.toString());
      final data = ResponseData.fromJson(response);
      return AttemptCommonModel.fromJson(data.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } catch (e, stackTrace) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetStatEntity> getAttemptStatDS(int attemptId) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getStatAttemptById + attemptId.toString());
      final data = ResponseData.fromJson(response);
      final result = GetStatModel.fromMap(data.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<UntStatEntity> getUNTStatDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.getUntStat);
      final data = ResponseData.fromJson(response);
      final result = UntStatModel.fromMap(data.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> saveQuestionDS(SaveQuestionParameter parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.saveQuestion + parameter.questionId.toString());
      final result = ResponseData<bool>.fromJson(response);
      return result.data ?? false;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

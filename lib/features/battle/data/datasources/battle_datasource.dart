import 'package:dio/dio.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/battle_answer_result_entity.dart';
import '../../domain/entities/battle_entity.dart';
import '../../domain/entities/battle_step_question_entity.dart';
import '../../domain/entities/finish_battle_result_entity.dart';
import '../../domain/entities/get_battle_stats_entity.dart';
import '../../domain/entities/given_battle_question_entity.dart';
import '../../domain/entities/propose_subject_for_battle_entity.dart';
import '../../domain/parameters/answer_battle_question_parameter.dart';
import '../../domain/parameters/create_battle_parameter.dart';
import '../../domain/parameters/create_battle_step_parameter.dart';
import '../../domain/parameters/get_active_battles_parameter.dart';
import '../../domain/parameters/get_battle_history_parameter.dart';
import '../../domain/parameters/join_to_battle_parameter.dart';
import '../models/battle_answer_result_model.dart';
import '../models/battle_model.dart';
import '../models/battle_step_question_model.dart';
import '../models/finish_battle_result_model.dart';
import '../models/get_battle_stats_model.dart';
import '../models/given_battle_question_model.dart';
import '../models/propose_subject_for_battle_model.dart';

abstract class BattleDataSourceInterface{
  Future<BattleAnswerResultEntity> answerBattleQuestionDS(AnswerBattleQuestionParameter parameter);
  Future<BattleEntity> createBattleDS(CreateBattleParameter parameter);
  Future<GivenBattleQuestionEntity> createBattleStepDS(CreateBattleStepParameter parameter);
  Future<FinishBattleResultEntity> finishBattleResultDS(int parameter);
  Future<PaginationData<List<BattleEntity>>> getActiveBattlesDS(GetActiveBattlesParameter parameter);
  Future<BattleEntity> getBattleByPromoDS(String promoCode);
  Future<PaginationData<List<BattleEntity>>> getBattleHistoryDS(GetBattleHistoryParameter parameter);
  Future<GetBattleStatsEntity> getBattleStatsDS();
  Future<GivenBattleQuestionEntity> getBattleStepDS(int parameter);
  Future<List<BattleStepQuestionEntity>> getBattleStepQuestionsDS(String parameter);
  Future<ProposeSubjectForBattleEntity> getBattleSubjectsDS(int parameter);
  Future<BattleEntity> joinToBattleDS(JoinToBattleParameter parameter);
  Future<List<BattleEntity>> myActiveBattlesDS();
}

class BattleDataSourceImpl extends BattleDataSourceInterface{
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<BattleAnswerResultEntity> answerBattleQuestionDS(AnswerBattleQuestionParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.battleAnswer,data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = BattleAnswerResultModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<BattleEntity> createBattleDS(CreateBattleParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.battleCreate,data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = BattleModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GivenBattleQuestionEntity> createBattleStepDS(CreateBattleStepParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.battleStepCreate,data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = GivenBattleQuestionModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<FinishBattleResultEntity> finishBattleResultDS(int parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.finishBattleResult + 86.toString());
      final responseData = ResponseData.fromJson(response);
      FinishBattleResultModel result = FinishBattleResultModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<BattleEntity>>> getActiveBattlesDS(GetActiveBattlesParameter parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getActiveBattles,
          queryParameters: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<BattleModel> data = BattleModel.fromMapList(
          paginationData.data.cast<Map<String, dynamic>>());
      PaginationData<List<BattleEntity>> result =
      PaginationData.fromType(paginationData, data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<BattleEntity> getBattleByPromoDS(String promoCode) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getBattleByPromoCode + promoCode);
      final responseData = ResponseData.fromJson(response);
      final result = BattleModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<BattleEntity>>> getBattleHistoryDS(GetBattleHistoryParameter parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getBattleHistory,
          queryParameters: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<BattleModel> data = BattleModel.fromMapList(
          paginationData.data.cast<Map<String, dynamic>>());
      PaginationData<List<BattleEntity>> result =
      PaginationData.fromType(paginationData, data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetBattleStatsEntity> getBattleStatsDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.getBattleStats);
      final responseData = ResponseData.fromJson(response);
      final result = GetBattleStatsModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GivenBattleQuestionEntity> getBattleStepDS(int parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getBattleStep + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = GivenBattleQuestionModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<BattleStepQuestionEntity>> getBattleStepQuestionsDS(String parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getBattleQuestionsByPromoCode + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = BattleStepQuestionModel.fromMapList(responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<ProposeSubjectForBattleEntity> getBattleSubjectsDS(int parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getBattleSubjects + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = ProposeSubjectForBattleModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<BattleEntity> joinToBattleDS(JoinToBattleParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.joinToBattle,data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = BattleModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<BattleEntity>> myActiveBattlesDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.myActiveBattles);
      final responseData = ResponseData.fromJson(response);
      List<BattleModel> result = BattleModel.fromMapList(responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
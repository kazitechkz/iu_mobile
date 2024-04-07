import 'package:dio/dio.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/common/models/pay_entity.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/get_all_tournaments_entity.dart';
import '../../domain/entities/get_subtournament_detail_entity.dart';
import '../../domain/entities/get_subtournament_results_entity.dart';
import '../../domain/entities/get_tournament_detail_entity.dart';
import '../../domain/entities/sub_tournament_participant_entity.dart';
import '../../domain/entities/sub_tournament_rival_entity.dart';
import '../../domain/entities/sub_tournament_winner_entity.dart';
import '../../domain/entities/tournament_award_entity.dart';
import '../../domain/entities/tournament_entity.dart';
import '../../domain/parameters/create_tournament_attempt_parameter.dart';
import '../../domain/parameters/get_list_of_tournaments_parameter.dart';
import '../../domain/parameters/get_sub_tournament_participant_parameter.dart';
import '../../domain/parameters/get_sub_tournament_results_parameter.dart';
import '../../domain/parameters/get_tournament_awards_parameter.dart';
import '../models/get_all_tournament_model.dart';
import '../models/get_subtournament_detail_model.dart';
import '../models/get_subtournament_results_model.dart';
import '../models/get_tournament_detail_model.dart';
import '../models/sub_tournament_participant_model.dart';
import '../models/sub_tournament_rival_model.dart';
import '../models/sub_tournament_winner_model.dart';
import '../models/tournament_award_model.dart';
import '../models/tournament_model.dart';

abstract class TournamentDataSourceInterface {
  Future<int> createTournamentDS(CreateTournamentAttemptParameter parameter);
  Future<GetAllTournamentEntity> getAllTournamentDS();
  Future<PaginationData<List<TournamentEntity>>> getListOfTournamentsDS(
      GetListOfTournamentParameter parameter);
  Future<GetSubTournamentDetailEntity> getSubTournamentDetailDS(
      int subTournamentId);
  Future<PaginationData<List<SubTournamentParticipantEntity>>>
      getSubTournamentParticipantsDS(
          GetSubTournamentParticipantsParameter parameter);
  Future<GetSubTournamentResultsEntity> getSubTournamentResultsDS(
      GetSubTournamentResultsParameter parameter);
  Future<List<SubTournamentRivalEntity>> getSubTournamentRivalsDS(int id);
  Future<List<SubTournamentWinnerEntity>> getSubTournamentWinnersDS(int id);
  Future<PaginationData<List<TournamentAwardEntity>>> getTournamentAwardsDS(
      GetTournamentAwardsParameter parameter);
  Future<GetTournamentDetailEntity> getTournamentDetailDS(int id);
  Future<bool> OnParticipateTournamentDS(
      CreateTournamentAttemptParameter parameter);
  Future<PayEntity> OnPayTournamentDS(
      CreateTournamentAttemptParameter parameter);
}

class TournamentDataSourceImpl extends TournamentDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<bool> OnParticipateTournamentDS(
      CreateTournamentAttemptParameter parameter) async {
    try {
      final response = await HttpUtil()
          .post(ApiConstant.participateTournament, data: parameter.toMap());
      final responseData = ResponseData<bool>.fromJson(response);
      return responseData.data ?? false;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PayEntity> OnPayTournamentDS(
      CreateTournamentAttemptParameter parameter) async {
    try {
      final response = await HttpUtil()
          .post(ApiConstant.payTournament, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      PayModel payModel = PayModel.fromMap(responseData.data);
      return payModel;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<int> createTournamentDS(
      CreateTournamentAttemptParameter parameter) async {
    try {
      final response = await HttpUtil()
          .post(ApiConstant.createTournamentAttempt, data: parameter.toMap());
      final responseData = ResponseData<int>.fromJson(response);
      return responseData.data ?? 0;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetAllTournamentEntity> getAllTournamentDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.getAllTournament);
      final responseData = ResponseData.fromJson(response);
      final result = GetAllTournamentModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<TournamentEntity>>> getListOfTournamentsDS(
      GetListOfTournamentParameter parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getListTournament,
          queryParameters: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<TournamentModel> data = TournamentModel.fromMapList(
          paginationData.data.cast<Map<String, dynamic>>());
      PaginationData<List<TournamentEntity>> result =
          PaginationData.fromType(paginationData, data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetSubTournamentDetailEntity> getSubTournamentDetailDS(
      int subTournamentId) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getSubTournamentDetail + 43.toString());
      final responseData = ResponseData.fromJson(response);
      GetSubTournamentDetailEntity result =
          GetSubTournamentDetailModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<SubTournamentParticipantEntity>>>
      getSubTournamentParticipantsDS(
          GetSubTournamentParticipantsParameter parameter) async {
    try {
      final response = await HttpUtil().get(
          ApiConstant.getSubTournamentParticipants + parameter.id.toString(),
          queryParameters: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final paginationData = PaginationData.fromMap(responseData.data);
      final result = PaginationData.fromType(
          paginationData,
          SubTournamentParticipantModel.fromMapList(
              paginationData.data.cast<Map<String, dynamic>>()));
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetSubTournamentResultsEntity> getSubTournamentResultsDS(
      GetSubTournamentResultsParameter parameter) async {
    try {
      final response = await HttpUtil().get(
          ApiConstant.getSubTournamentResults + parameter.id.toString(),
          queryParameters: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = GetSubTournamentResultsModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<SubTournamentRivalEntity>> getSubTournamentRivalsDS(
      int id) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getSubTournamentRivals + id.toString());
      final responseData = ResponseData.fromJson(response);
      final result = SubTournamentRivalModel.fromMapList(
          responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<SubTournamentWinnerEntity>> getSubTournamentWinnersDS(
      int id) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.getSubTournamentWinners + id.toString());
      final responseData = ResponseData.fromJson(response);
      final result = SubTournamentWinnerModel.fromMapList(
          responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<TournamentAwardEntity>>> getTournamentAwardsDS(
      GetTournamentAwardsParameter parameter) async {
    try {
      final response = await HttpUtil().get(
          ApiConstant.getTournamentAwards + parameter.id.toString(),
          queryParameters: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final paginationData = PaginationData.fromMap(responseData.data);
      final result = PaginationData.fromType(
          paginationData,
          TournamentAwardModel.fromMapList(
              paginationData.data.cast<Map<String, dynamic>>()));
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetTournamentDetailEntity> getTournamentDetailDS(int id) async {
    try {
      final response =
          await HttpUtil().get(ApiConstant.getTournamentDetail + id.toString());
      final responseData = ResponseData.fromJson(response);
      GetTournamentDetailEntity result =
          GetTournamentDetailModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

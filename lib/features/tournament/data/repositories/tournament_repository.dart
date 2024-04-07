import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pay_entity.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/tournament/domain/entities/get_all_tournaments_entity.dart';
import 'package:iu/features/tournament/domain/entities/get_subtournament_detail_entity.dart';
import 'package:iu/features/tournament/domain/entities/get_subtournament_results_entity.dart';
import 'package:iu/features/tournament/domain/entities/get_tournament_detail_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_participant_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_rival_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_winner_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_award_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';
import 'package:iu/features/tournament/domain/interfaces/tournament_interface.dart';
import 'package:iu/features/tournament/domain/parameters/create_tournament_attempt_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_list_of_tournaments_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_sub_tournament_participant_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_sub_tournament_results_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_tournament_awards_parameter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../datasources/tournament_datasource.dart';

class TournamentRepository implements TournamentInterface {
  final TournamentDataSourceInterface _tournamentDataSourceInterface;

  const TournamentRepository(this._tournamentDataSourceInterface);

  @override
  ResultFuture<bool> OnParticipateTournament(
      CreateTournamentAttemptParameter parameter) async {
    try {
      final result =
          await _tournamentDataSourceInterface.OnParticipateTournamentDS(
              parameter);
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
  ResultFuture<PayEntity> OnPayTournament(
      CreateTournamentAttemptParameter parameter) async {
    try {
      final result =
          await _tournamentDataSourceInterface.OnPayTournamentDS(parameter);
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
  ResultFuture<int> createTournament(
      CreateTournamentAttemptParameter parameter) async {
    try {
      final result =
          await _tournamentDataSourceInterface.createTournamentDS(parameter);
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
  ResultFuture<GetAllTournamentEntity> getAllTournament() async {
    try {
      final result = await _tournamentDataSourceInterface.getAllTournamentDS();
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
  ResultFuture<PaginationData<List<TournamentEntity>>> getListOfTournaments(
      GetListOfTournamentParameter parameter) async {
    try {
      final result = await _tournamentDataSourceInterface
          .getListOfTournamentsDS(parameter);
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
  ResultFuture<GetSubTournamentDetailEntity> getSubTournamentDetail(
      int subTournamentId) async {
    try {
      final result = await _tournamentDataSourceInterface
          .getSubTournamentDetailDS(subTournamentId);
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
  ResultFuture<PaginationData<List<SubTournamentParticipantEntity>>>
      getSubTournamentParticipants(
          GetSubTournamentParticipantsParameter parameter) async {
    try {
      final result = await _tournamentDataSourceInterface
          .getSubTournamentParticipantsDS(parameter);
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
  ResultFuture<GetSubTournamentResultsEntity> getSubTournamentResults(
      GetSubTournamentResultsParameter parameter) async {
    try {
      final result = await _tournamentDataSourceInterface
          .getSubTournamentResultsDS(parameter);
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
  ResultFuture<List<SubTournamentRivalEntity>> getSubTournamentRivals(
      int id) async {
    try {
      final result =
          await _tournamentDataSourceInterface.getSubTournamentRivalsDS(id);
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
  ResultFuture<List<SubTournamentWinnerEntity>> getSubTournamentWinners(
      int id) async {
    try {
      final result =
          await _tournamentDataSourceInterface.getSubTournamentWinnersDS(id);
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
  ResultFuture<PaginationData<List<TournamentAwardEntity>>> getTournamentAwards(
      GetTournamentAwardsParameter parameter) async {
    try {
      final result =
          await _tournamentDataSourceInterface.getTournamentAwardsDS(parameter);
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
  ResultFuture<GetTournamentDetailEntity> getTournamentDetail(int id) async {
    try {
      final result =
          await _tournamentDataSourceInterface.getTournamentDetailDS(id);
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

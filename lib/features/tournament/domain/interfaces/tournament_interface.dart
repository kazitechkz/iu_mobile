import 'package:iu/core/common/models/pay_entity.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_participant_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_rival_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_winner_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_award_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';
import 'package:iu/features/tournament/domain/parameters/create_tournament_attempt_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_list_of_tournaments_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_sub_tournament_participant_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_sub_tournament_results_parameter.dart';
import 'package:iu/features/tournament/domain/parameters/get_tournament_awards_parameter.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/get_all_tournaments_entity.dart';
import '../entities/get_subtournament_detail_entity.dart';
import '../entities/get_subtournament_results_entity.dart';
import '../entities/get_tournament_detail_entity.dart';

abstract class TournamentInterface {
  ResultFuture<int> createTournament(
      CreateTournamentAttemptParameter parameter);
  ResultFuture<GetAllTournamentEntity> getAllTournament();
  ResultFuture<PaginationData<List<TournamentEntity>>> getListOfTournaments(
      GetListOfTournamentParameter parameter);
  ResultFuture<GetSubTournamentDetailEntity> getSubTournamentDetail(
      int subTournamentId);
  ResultFuture<PaginationData<List<SubTournamentParticipantEntity>>>
      getSubTournamentParticipants(
          GetSubTournamentParticipantsParameter parameter);
  ResultFuture<GetSubTournamentResultsEntity> getSubTournamentResults(
      GetSubTournamentResultsParameter parameter);
  ResultFuture<List<SubTournamentRivalEntity>> getSubTournamentRivals(int id);
  ResultFuture<List<SubTournamentWinnerEntity>> getSubTournamentWinners(int id);
  ResultFuture<PaginationData<List<TournamentAwardEntity>>> getTournamentAwards(
      GetTournamentAwardsParameter parameter);
  ResultFuture<GetTournamentDetailEntity> getTournamentDetail(int id);
  ResultFuture<bool> OnParticipateTournament(
      CreateTournamentAttemptParameter parameter);
  ResultFuture<PayEntity> OnPayTournament(
      CreateTournamentAttemptParameter parameter);
}

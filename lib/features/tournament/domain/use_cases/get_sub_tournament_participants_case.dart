import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../entities/sub_tournament_participant_entity.dart';
import '../interfaces/tournament_interface.dart';
import '../parameters/get_sub_tournament_participant_parameter.dart';

class GetSubTournamentParticipantsCase extends UseCaseWithParams<
    PaginationData<List<SubTournamentParticipantEntity>>,
    GetSubTournamentParticipantsParameter> {
  final TournamentInterface _tournamentInterface;
  const GetSubTournamentParticipantsCase(this._tournamentInterface);

  @override
  ResultFuture<PaginationData<List<SubTournamentParticipantEntity>>> call(
      GetSubTournamentParticipantsParameter params) {
    return this._tournamentInterface.getSubTournamentParticipants(params);
  }
}

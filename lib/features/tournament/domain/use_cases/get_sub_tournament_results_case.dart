import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_subtournament_results_entity.dart';
import '../interfaces/tournament_interface.dart';
import '../parameters/get_sub_tournament_results_parameter.dart';

class GetSubTournamentResultsCase extends UseCaseWithParams<
    GetSubTournamentResultsEntity, GetSubTournamentResultsParameter> {
  final TournamentInterface _tournamentInterface;
  const GetSubTournamentResultsCase(this._tournamentInterface);

  @override
  ResultFuture<GetSubTournamentResultsEntity> call(
      GetSubTournamentResultsParameter params) {
    return this._tournamentInterface.getSubTournamentResults(params);
  }
}

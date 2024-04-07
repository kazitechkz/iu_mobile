import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/sub_tournament_winner_entity.dart';
import '../interfaces/tournament_interface.dart';

class GetSubTournamentWinnersCase
    extends UseCaseWithParams<List<SubTournamentWinnerEntity>, int> {
  final TournamentInterface _tournamentInterface;
  const GetSubTournamentWinnersCase(this._tournamentInterface);

  @override
  ResultFuture<List<SubTournamentWinnerEntity>> call(int params) {
    return this._tournamentInterface.getSubTournamentWinners(params);
  }
}

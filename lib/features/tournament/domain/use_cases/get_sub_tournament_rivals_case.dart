import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/sub_tournament_rival_entity.dart';
import '../interfaces/tournament_interface.dart';

class GetSubTournamentRivalsCase
    extends UseCaseWithParams<List<SubTournamentRivalEntity>, int> {
  final TournamentInterface _tournamentInterface;
  const GetSubTournamentRivalsCase(this._tournamentInterface);

  @override
  ResultFuture<List<SubTournamentRivalEntity>> call(int params) {
    return this._tournamentInterface.getSubTournamentRivals(params);
  }
}

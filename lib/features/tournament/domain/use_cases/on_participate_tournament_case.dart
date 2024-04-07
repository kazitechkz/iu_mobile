import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../interfaces/tournament_interface.dart';
import '../parameters/create_tournament_attempt_parameter.dart';

class OnParticipateTournamentCase
    extends UseCaseWithParams<bool, CreateTournamentAttemptParameter> {
  final TournamentInterface _tournamentInterface;
  const OnParticipateTournamentCase(this._tournamentInterface);

  @override
  ResultFuture<bool> call(CreateTournamentAttemptParameter params) {
    return this._tournamentInterface.OnParticipateTournament(params);
  }
}

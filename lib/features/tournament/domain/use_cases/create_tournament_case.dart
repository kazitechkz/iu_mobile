import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/tournament/domain/parameters/create_tournament_attempt_parameter.dart';

import '../interfaces/tournament_interface.dart';

class CreateTournamentCase
    extends UseCaseWithParams<int, CreateTournamentAttemptParameter> {
  final TournamentInterface _tournamentInterface;
  const CreateTournamentCase(this._tournamentInterface);

  @override
  ResultFuture<int> call(CreateTournamentAttemptParameter params) {
    return _tournamentInterface.createTournament(params);
  }
}

import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/get_all_tournaments_entity.dart';
import '../interfaces/tournament_interface.dart';

class GetAllTournamentCase
    extends UseCaseWithoutParams<GetAllTournamentEntity> {
  final TournamentInterface _tournamentInterface;
  const GetAllTournamentCase(this._tournamentInterface);

  @override
  ResultFuture<GetAllTournamentEntity> call() {
    return _tournamentInterface.getAllTournament();
  }
}

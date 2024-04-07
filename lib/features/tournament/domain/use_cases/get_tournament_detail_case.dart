import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_tournament_detail_entity.dart';
import '../interfaces/tournament_interface.dart';

class GetTournamentDetailCase
    extends UseCaseWithParams<GetTournamentDetailEntity, int> {
  final TournamentInterface _tournamentInterface;
  const GetTournamentDetailCase(this._tournamentInterface);

  @override
  ResultFuture<GetTournamentDetailEntity> call(int params) {
    return this._tournamentInterface.getTournamentDetail(params);
  }
}

import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_subtournament_detail_entity.dart';
import '../interfaces/tournament_interface.dart';

class GetSubTournamentDetailCase
    extends UseCaseWithParams<GetSubTournamentDetailEntity, int> {
  final TournamentInterface _tournamentInterface;
  const GetSubTournamentDetailCase(this._tournamentInterface);
  @override
  ResultFuture<GetSubTournamentDetailEntity> call(int params) {
    return this._tournamentInterface.getSubTournamentDetail(params);
  }
}

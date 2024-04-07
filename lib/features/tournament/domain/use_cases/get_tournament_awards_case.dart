import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/tournament_award_entity.dart';
import '../interfaces/tournament_interface.dart';
import '../parameters/get_tournament_awards_parameter.dart';

class GetTournamentAwardsCase extends UseCaseWithParams<
    PaginationData<List<TournamentAwardEntity>>, GetTournamentAwardsParameter> {
  final TournamentInterface _tournamentInterface;
  const GetTournamentAwardsCase(this._tournamentInterface);

  @override
  ResultFuture<PaginationData<List<TournamentAwardEntity>>> call(
      GetTournamentAwardsParameter params) {
    return this._tournamentInterface.getTournamentAwards(params);
  }
}

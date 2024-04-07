import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/tournament/domain/parameters/get_list_of_tournaments_parameter.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/tournament_entity.dart';
import '../interfaces/tournament_interface.dart';

class GetListOfTournamentsCase extends UseCaseWithParams<
    PaginationData<List<TournamentEntity>>, GetListOfTournamentParameter> {
  final TournamentInterface _tournamentInterface;
  const GetListOfTournamentsCase(this._tournamentInterface);

  @override
  ResultFuture<PaginationData<List<TournamentEntity>>> call(
      GetListOfTournamentParameter params) {
    return _tournamentInterface.getListOfTournaments(params);
  }
}

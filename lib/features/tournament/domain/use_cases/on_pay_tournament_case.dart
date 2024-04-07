import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../../../../core/common/models/pay_entity.dart';
import '../interfaces/tournament_interface.dart';
import '../parameters/create_tournament_attempt_parameter.dart';

class OnPayTournamentCase
    extends UseCaseWithParams<PayEntity, CreateTournamentAttemptParameter> {
  final TournamentInterface _tournamentInterface;
  const OnPayTournamentCase(this._tournamentInterface);

  @override
  ResultFuture<PayEntity> call(CreateTournamentAttemptParameter params) {
    return this._tournamentInterface.OnPayTournament(params);
  }
}

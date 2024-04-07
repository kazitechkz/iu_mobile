import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_step_entity.dart';

class GetTournamentDetailEntity extends Equatable {
  final TournamentEntity tournament;
  final List<TournamentStepEntity> steps;
  final bool isJoin;
  final SubTournamentEntity? firstSubTournament;
  final SubTournamentEntity? currentSubTournament;
  final bool checkAccess;
  final bool isReg;
  final OrdinaryUserEntity? winnerTournament;

  const GetTournamentDetailEntity(
      {required this.tournament,
      required this.steps,
      required this.isJoin,
      this.firstSubTournament,
      this.currentSubTournament,
      required this.checkAccess,
      required this.isReg,
      this.winnerTournament});

  @override
  List<Object?> get props => [tournament, steps, isJoin, checkAccess, isReg];
}

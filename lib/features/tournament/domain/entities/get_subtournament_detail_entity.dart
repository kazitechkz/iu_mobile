import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_result_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';

class GetSubTournamentDetailEntity extends Equatable {
  final TournamentEntity tournament;
  final List<int> subTournamentIds;
  final SubTournamentEntity subTournament;
  final SubTournamentResultEntity? myResult;

  const GetSubTournamentDetailEntity(
      {required this.tournament,
      required this.subTournamentIds,
      required this.subTournament,
      this.myResult});

  @override
  List<Object?> get props =>
      [tournament, subTournamentIds, subTournament, myResult];
}

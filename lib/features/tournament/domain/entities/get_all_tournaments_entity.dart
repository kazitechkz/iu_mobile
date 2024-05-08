import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';

class GetAllTournamentEntity extends Equatable {
  final List<TournamentEntity> open;
  final List<TournamentEntity> participated;
  final Map<int, int> tournamentIds;

  const GetAllTournamentEntity(
      {required this.open,
      required this.participated,
      required this.tournamentIds});

  @override
  List<Object?> get props => [open, participated, tournamentIds];
}

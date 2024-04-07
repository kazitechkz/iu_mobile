import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

class SubTournamentWinnerEntity extends Equatable {
  final int id;
  final int userId;
  final int subTournamentId;
  final TournamentUserEntity? user;
  final SubTournamentEntity? subTournament;

  SubTournamentWinnerEntity(
      {required this.id,
      required this.userId,
      required this.subTournamentId,
      this.user,
      this.subTournament});

  @override
  List<Object?> get props => [id, userId, subTournamentId];
}

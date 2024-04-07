import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

class SubTournamentParticipantEntity extends Equatable {
  final int id;
  final int userId;
  final int subTournamentId;
  final int status;
  final SubTournamentEntity? subTournament;
  final TournamentUserEntity? user;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const SubTournamentParticipantEntity(
      {required this.id,
      required this.userId,
      required this.subTournamentId,
      required this.status,
      this.subTournament,
      this.user,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [id, userId, subTournamentId, status];
}

import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

class SubTournamentResultEntity extends Equatable {
  final int id;
  final int userId;
  final int subTournamentId;
  final int? point;
  final int? time;
  final int attemptId;
  final SubTournamentEntity? subTournament;
  final TournamentUserEntity? user;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const SubTournamentResultEntity({
    required this.id,
    required this.userId,
    required this.subTournamentId,
    this.point,
    this.time,
    required this.attemptId,
    this.subTournament,
    this.user,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, subTournamentId, attemptId];
}

import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

class TournamentAwardEntity extends Equatable {
  final int id;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final bool isAwarded;
  final int tournamentId;
  final int subTournamentId;
  final int userId;
  final int order;
  final TournamentUserEntity? user;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const TournamentAwardEntity(
      {required this.id,
      required this.titleRu,
      required this.titleKk,
      this.titleEn,
      required this.isAwarded,
      required this.tournamentId,
      required this.subTournamentId,
      required this.userId,
      required this.order,
      this.user,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        titleRu,
        titleKk,
        isAwarded,
        tournamentId,
        subTournamentId,
        userId,
        order
      ];
}

import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

class SubTournamentRivalEntity extends Equatable {
  final int id;
  final int rivalOne;
  final int pointOne;
  final int timeOne;
  final int rivalTwo;
  final int pointTwo;
  final int timeTwo;
  final int? winner;
  final int subTournamentId;
  final TournamentUserEntity? winnerUser;
  final TournamentUserEntity? rivalOneUser;
  final TournamentUserEntity? rivalTwoUser;
  final SubTournamentEntity? subTournament;

  const SubTournamentRivalEntity(
      {required this.id,
      required this.rivalOne,
      required this.pointOne,
      required this.timeOne,
      required this.rivalTwo,
      required this.pointTwo,
      required this.timeTwo,
      this.winner,
      required this.subTournamentId,
      this.winnerUser,
      this.rivalOneUser,
      this.rivalTwoUser,
      this.subTournament});

  @override
  List<Object?> get props => [
        id,
        rivalOne,
        pointOne,
        timeOne,
        rivalTwo,
        pointTwo,
        timeTwo,
        winner,
        subTournamentId
      ];
}

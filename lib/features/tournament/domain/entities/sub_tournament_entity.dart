import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_participant_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_result_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_step_entity.dart';

class SubTournamentEntity extends Equatable {
  final int id;
  final int tournamentId;
  final int stepId;
  final int questionQuantity;
  final int maxPoint;
  final int singleQuestionQuantity;
  final int multipleQuestionQuantity;
  final int contextQuestionQuantity;
  final bool isFinished;
  final bool isCurrent;
  final int time;
  final String startAt;
  final String endAt;
  final TournamentEntity? tournament;
  final TournamentStepEntity? tournamentStep;
  final List<SubTournamentResultEntity>? subTournamentResults;
  final List<SubTournamentParticipantEntity>? subtournamentParticipants;

  const SubTournamentEntity(
      {required this.id,
      required this.tournamentId,
      required this.stepId,
      required this.questionQuantity,
      required this.maxPoint,
      required this.singleQuestionQuantity,
      required this.multipleQuestionQuantity,
      required this.contextQuestionQuantity,
      required this.isFinished,
      required this.isCurrent,
      required this.time,
      required this.startAt,
      required this.endAt,
      this.tournament,
      this.tournamentStep,
      this.subTournamentResults,
      this.subtournamentParticipants});

  @override
  List<Object?> get props => throw UnimplementedError();
}

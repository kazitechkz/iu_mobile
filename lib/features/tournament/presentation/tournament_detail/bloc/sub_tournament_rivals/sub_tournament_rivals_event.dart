part of 'sub_tournament_rivals_bloc.dart';

@immutable
sealed class SubTournamentRivalsEvent {}

class SubTournamentRivalsGetByIdEvent extends SubTournamentRivalsEvent {
  final int subTournamentId;
  final int stepId;
  SubTournamentRivalsGetByIdEvent(
      {required this.subTournamentId, required this.stepId});
}

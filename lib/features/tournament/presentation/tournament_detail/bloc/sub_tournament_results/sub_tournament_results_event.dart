part of 'sub_tournament_results_bloc.dart';

@immutable
sealed class SubTournamentResultsEvent {}

class SubTournamentResultsBySubTournamentIdEvent
    extends SubTournamentResultsEvent {
  final GetSubTournamentResultsParameter parameter;
  SubTournamentResultsBySubTournamentIdEvent(this.parameter);
}

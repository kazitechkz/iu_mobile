part of 'tournament_awards_bloc.dart';

@immutable
sealed class TournamentAwardsEvent {}

class TournamentAwardByTournamentIdEvent extends TournamentAwardsEvent {
  final GetTournamentAwardsParameter params;
  TournamentAwardByTournamentIdEvent(this.params);
}

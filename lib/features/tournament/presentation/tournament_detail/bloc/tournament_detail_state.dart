part of 'tournament_detail_bloc.dart';

@immutable
sealed class TournamentDetailState extends Equatable {}

final class TournamentDetailInitialState extends TournamentDetailState {
  @override
  List<Object?> get props => [];
}

final class TournamentDetailLoadingState extends TournamentDetailState {
  @override
  List<Object?> get props => [];
}

final class TournamentDetailFailedState extends TournamentDetailState {
  final FailureData failureData;
  TournamentDetailFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class TournamentDetailSuccessState extends TournamentDetailState {
  final GetTournamentDetailEntity tournament;
  TournamentDetailSuccessState(this.tournament);
  @override
  List<Object?> get props => [];
}

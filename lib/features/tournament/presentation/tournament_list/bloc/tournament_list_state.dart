part of 'tournament_list_bloc.dart';

abstract class TournamentListState extends Equatable {}

class TournamentListInitialState extends TournamentListState {
  @override
  List<Object?> get props => [];
}
class TournamentListLoadingState extends TournamentListState {
  @override
  List<Object?> get props => [];
}
class TournamentListFailedState extends TournamentListState {
  final FailureData failureData;
  TournamentListFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}
class TournamentListSuccessState extends TournamentListState {
  final GetAllTournamentEntity data;
  TournamentListSuccessState(this.data);
  @override
  List<Object?> get props => [data];
}

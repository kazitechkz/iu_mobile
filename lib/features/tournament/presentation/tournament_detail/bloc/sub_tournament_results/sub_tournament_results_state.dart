part of 'sub_tournament_results_bloc.dart';

@immutable
sealed class SubTournamentResultsState extends Equatable {}

final class SubTournamentResultsInitialState extends SubTournamentResultsState {
  @override
  List<Object?> get props => [];
}

final class SubTournamentResultsLoadingState extends SubTournamentResultsState {
  @override
  List<Object?> get props => [];
}

final class SubTournamentResultsFailedState extends SubTournamentResultsState {
  final FailureData failureData;
  SubTournamentResultsFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class SubTournamentResultsSuccessState extends SubTournamentResultsState {
  final GetSubTournamentResultsEntity resultsData;
  final List<SubTournamentResultEntity> results;
  SubTournamentResultsSuccessState(
      {required this.results, required this.resultsData});
  SubTournamentResultsSuccessState copyWith(
      {GetSubTournamentResultsEntity? resultsDataRemote,
      List<SubTournamentResultEntity>? resultsRemote}) {
    return SubTournamentResultsSuccessState(
      resultsData: resultsDataRemote ?? this.resultsData,
      results: resultsRemote ?? this.results,
    );
  }

  @override
  List<Object?> get props => [resultsData, results];
}

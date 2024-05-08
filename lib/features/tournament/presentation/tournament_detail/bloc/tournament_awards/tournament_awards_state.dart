part of 'tournament_awards_bloc.dart';

@immutable
sealed class TournamentAwardsState extends Equatable {}

final class TournamentAwardsInitialState extends TournamentAwardsState {
  @override
  List<Object?> get props => [];
}

final class TournamentAwardsLoadingState extends TournamentAwardsState {
  @override
  List<Object?> get props => [];
}

final class TournamentAwardsFailedState extends TournamentAwardsState {
  final FailureData failureData;

  TournamentAwardsFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData];
}

final class TournamentAwardsSuccessState extends TournamentAwardsState {
  final PaginationData<List<TournamentAwardEntity>> awardData;
  final List<TournamentAwardEntity> awards;
  TournamentAwardsSuccessState({required this.awardData, required this.awards});
  TournamentAwardsSuccessState copyWith(
      {PaginationData<List<TournamentAwardEntity>>? AwardData,
      List<TournamentAwardEntity>? Awards}) {
    return TournamentAwardsSuccessState(
        awardData: AwardData ?? this.awardData, awards: Awards ?? this.awards);
  }

  @override
  List<Object?> get props => [awardData, awards];
}

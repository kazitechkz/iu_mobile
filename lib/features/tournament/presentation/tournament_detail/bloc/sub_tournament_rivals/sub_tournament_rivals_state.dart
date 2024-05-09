part of 'sub_tournament_rivals_bloc.dart';

@immutable
sealed class SubTournamentRivalsState extends Equatable {}

class SubTournamentRivalsInitialState extends SubTournamentRivalsState {
  @override
  List<Object?> get props => [];
}

class SubTournamentRivalsLoadingState extends SubTournamentRivalsState {
  @override
  List<Object?> get props => [];
}

class SubTournamentRivalsFailedState extends SubTournamentRivalsState {
  final FailureData failureData;

  SubTournamentRivalsFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData];
}

class SubTournamentRivalsSuccessState extends SubTournamentRivalsState {
  List<SubTournamentRivalEntity>? rivalsOneFour;
  List<SubTournamentRivalEntity>? rivalsOneTwo;
  List<SubTournamentRivalEntity>? rivalsFinal;

  SubTournamentRivalsSuccessState(
      {this.rivalsOneFour, this.rivalsOneTwo, this.rivalsFinal});

  SubTournamentRivalsSuccessState copyWith({
    List<SubTournamentRivalEntity>? RivalsOneFour,
    List<SubTournamentRivalEntity>? RivalsOneTwo,
    List<SubTournamentRivalEntity>? RivalsFinal,
  }) {
    print(rivalsOneFour);
    return SubTournamentRivalsSuccessState(
      rivalsOneFour: RivalsOneFour ?? rivalsOneFour,
      rivalsOneTwo: RivalsOneTwo ?? rivalsOneTwo,
      rivalsFinal: RivalsFinal ?? rivalsFinal,
    );
  }

  @override
  List<Object?> get props => [rivalsOneFour, rivalsOneTwo, rivalsFinal];
}

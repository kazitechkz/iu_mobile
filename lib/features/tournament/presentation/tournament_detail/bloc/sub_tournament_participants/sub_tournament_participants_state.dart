part of 'sub_tournament_participants_bloc.dart';

@immutable
sealed class SubTournamentParticipantsState extends Equatable {}

final class SubTournamentParticipantsInitialState
    extends SubTournamentParticipantsState {
  @override
  List<Object?> get props => [];
}

final class SubTournamentParticipantsLoadingState
    extends SubTournamentParticipantsState {
  @override
  List<Object?> get props => [];
}

final class SubTournamentParticipantsFailedState
    extends SubTournamentParticipantsState {
  final FailureData failureData;

  SubTournamentParticipantsFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData];
}

final class SubTournamentParticipantsSuccessState
    extends SubTournamentParticipantsState {
  final PaginationData<List<SubTournamentParticipantEntity>> participantsData;
  final List<SubTournamentParticipantEntity> participants;

  SubTournamentParticipantsSuccessState(
      {required this.participantsData, required this.participants});

  SubTournamentParticipantsSuccessState copyWith(
      {PaginationData<List<SubTournamentParticipantEntity>>? participantsData,
      List<SubTournamentParticipantEntity>? participants}) {
    return SubTournamentParticipantsSuccessState(
      participantsData: participantsData ?? this.participantsData,
      participants: participants ?? this.participants,
    );
  }

  @override
  List<Object?> get props => [participantsData, participants];
}

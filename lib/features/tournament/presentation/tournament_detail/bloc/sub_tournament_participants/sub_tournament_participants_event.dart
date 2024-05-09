part of 'sub_tournament_participants_bloc.dart';

@immutable
sealed class SubTournamentParticipantsEvent {}

class SubTournamentGetParticipantsEvent extends SubTournamentParticipantsEvent {
  final GetSubTournamentParticipantsParameter parameter;
  SubTournamentGetParticipantsEvent(this.parameter);
}

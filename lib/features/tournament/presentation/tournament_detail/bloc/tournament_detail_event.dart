part of 'tournament_detail_bloc.dart';

abstract class TournamentDetailEvent {}

class TournamentDetailGetActualEvent extends TournamentDetailEvent {
  final int tournamentId;
  TournamentDetailGetActualEvent(this.tournamentId);
}

part of 'full_stat_bloc.dart';

abstract class FullStatEvent {}

class FullStatGetStatsEvent extends FullStatEvent {
  final FullStatParameter parameter;

  FullStatGetStatsEvent(this.parameter);
}

class FullStatGetSubjectsEvent extends FullStatEvent {}

class FullStatGetAttemptTypesEvent extends FullStatEvent {}

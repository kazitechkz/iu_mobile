part of 'stat_attempt_bloc.dart';

abstract class StatAttemptEvent {}

class StatGetByAttemptIdEvent extends StatAttemptEvent {
  final int attemptId;
  StatGetByAttemptIdEvent(this.attemptId);
}

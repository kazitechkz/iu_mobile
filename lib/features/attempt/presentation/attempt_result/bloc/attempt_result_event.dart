part of 'attempt_result_bloc.dart';


class AttemptResultEvent {}

class AttemptResultByAttemptIdEvent extends AttemptResultEvent{
  final int attemptId;
  AttemptResultByAttemptIdEvent(this.attemptId);
}
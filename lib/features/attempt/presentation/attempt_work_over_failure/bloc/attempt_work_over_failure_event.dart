part of 'attempt_work_over_failure_bloc.dart';

@immutable
sealed class AttemptWorkOverFailureEvent {}

class AttemptWorkOverFailureGetByAttemptIdEvent
    extends AttemptWorkOverFailureEvent {
  final int attemptId;

  AttemptWorkOverFailureGetByAttemptIdEvent(this.attemptId);

  @override
  List<Object?> get props => [attemptId];
}

class AttemptWorkOverFailureChangeSubjectEvent
    extends AttemptWorkOverFailureEvent {
  final int subjectId;

  AttemptWorkOverFailureChangeSubjectEvent(this.subjectId);

  @override
  List<Object?> get props => [subjectId];
}

class AttemptWorkOverFailureSliderChangeEvent
    extends AttemptWorkOverFailureEvent {
  final int activeSliderId;

  AttemptWorkOverFailureSliderChangeEvent(this.activeSliderId);

  @override
  List<Object?> get props => [activeSliderId];
}

class AttemptWorkOverFailureSaveQuestionEvent
    extends AttemptWorkOverFailureEvent {
  final int questionId;
  AttemptWorkOverFailureSaveQuestionEvent(this.questionId);
  @override
  List<Object?> get props => [questionId];
}

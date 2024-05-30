part of 'result_career_quiz_bloc.dart';

@immutable
abstract class ResultCareerQuizEvent {}

class ResultCareerQuizByAttemptIdEvent extends ResultCareerQuizEvent{
  final int attemptId;
  ResultCareerQuizByAttemptIdEvent(this.attemptId);
}

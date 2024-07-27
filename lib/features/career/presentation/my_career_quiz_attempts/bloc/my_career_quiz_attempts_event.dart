part of 'my_career_quiz_attempts_bloc.dart';

@immutable
abstract class MyCareerQuizAttemptsEvent {}

class MyCareerQuizAttemptsByQuizIdEvent extends MyCareerQuizAttemptsEvent {
  final MyCareerAttemptsParameter parameter;
  MyCareerQuizAttemptsByQuizIdEvent(this.parameter);
}

class MyCareerQuizAttemptsPaginateEvent extends MyCareerQuizAttemptsEvent {}

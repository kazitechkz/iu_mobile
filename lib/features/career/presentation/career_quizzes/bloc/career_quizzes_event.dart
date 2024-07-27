part of 'career_quizzes_bloc.dart';

@immutable
abstract class CareerQuizzesEvent {}

class GetCareerQuizzesEvent extends CareerQuizzesEvent {
  final GetCareerQuizzesParameter parameter;
  GetCareerQuizzesEvent(this.parameter);
}

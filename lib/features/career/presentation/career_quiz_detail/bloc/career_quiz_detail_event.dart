part of 'career_quiz_detail_bloc.dart';

@immutable
abstract class CareerQuizDetailEvent {}

class GetCareerQuizDetailByIdEvent extends CareerQuizDetailEvent{
  final int quizId;
  GetCareerQuizDetailByIdEvent(this.quizId);
}

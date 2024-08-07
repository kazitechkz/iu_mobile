part of 'pass_career_one_bloc.dart';

@immutable
abstract class PassCareerOneEvent {}

class PassCareerOneGetAllEvent extends PassCareerOneEvent {
  final int quizId;
  PassCareerOneGetAllEvent(this.quizId);
}

class PassCareerOneGiveAnswerEvent extends PassCareerOneEvent {
  final int questionId;
  final int answerId;
  final int answerValue;
  PassCareerOneGiveAnswerEvent(
      {required this.questionId,
      required this.answerId,
      required this.answerValue});
}

class PassCareerOneFinishEvent extends PassCareerOneEvent {
  final FinishCareerQuizParameter parameter;
  PassCareerOneFinishEvent({required this.parameter});
}

class PassCareerOneChangeSliderEvent extends PassCareerOneEvent {
  final int pageIndex;
  PassCareerOneChangeSliderEvent(this.pageIndex);
}

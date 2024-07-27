part of 'pass_career_drag_drop_bloc.dart';

@immutable
sealed class PassCareerDragDropEvent {}

class PassCareerDragDropGetCareerByIdEvent extends PassCareerDragDropEvent {
  final int quizId;
  PassCareerDragDropGetCareerByIdEvent(this.quizId);
}

class PassCareerDragDropChangeSliderEvent extends PassCareerDragDropEvent {
  final int pageIndex;
  PassCareerDragDropChangeSliderEvent(this.pageIndex);
}

class PassCareerDragDropSelectAnswerEvent extends PassCareerDragDropEvent {
  final int questionId;
  final int answerId;
  final int? answerValue;
  PassCareerDragDropSelectAnswerEvent(
      {required this.questionId,
      required this.answerId,
      required this.answerValue});
}

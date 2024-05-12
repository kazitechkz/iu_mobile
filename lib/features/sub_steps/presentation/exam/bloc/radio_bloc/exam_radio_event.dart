part of 'exam_radio_bloc.dart';

sealed class ExamRadioEvent extends Equatable {
  const ExamRadioEvent();
}

class AnswerSelected extends ExamRadioEvent {
  final PassSubStepExamParams params;
  final int index; // Добавляем индекс для идентификации

  const AnswerSelected(this.params, this.index);

  @override
  List<Object> get props => [params, index];
}

class UpdateAnswers extends ExamRadioEvent {
  final List<PassSubStepExamParams> updatedAnswers;

  const UpdateAnswers(this.updatedAnswers);

  @override
  List<Object> get props => [updatedAnswers];
}

class SubmitAnswers extends ExamRadioEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
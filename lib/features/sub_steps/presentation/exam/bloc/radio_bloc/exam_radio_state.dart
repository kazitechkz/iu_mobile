part of 'exam_radio_bloc.dart';

sealed class ExamRadioState extends Equatable {
  const ExamRadioState();
}

final class ExamRadioInitial extends ExamRadioState {
  final List<PassSubStepExamParams> answers;

  const ExamRadioInitial({this.answers = const []});

  ExamRadioInitial copyWith({List<PassSubStepExamParams>? answers}) {
    return ExamRadioInitial(answers: answers ?? this.answers);
  }

  @override
  List<Object> get props => [answers];
}

import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';

abstract class PassAttemptEvent extends Equatable {}

class PassAttemptGetByAttemptIdEvent extends PassAttemptEvent {
  final int attemptId;
  PassAttemptGetByAttemptIdEvent(this.attemptId);
  @override
  List<Object?> get props => [attemptId];
}

class PassAttemptChangeSubjectEvent extends PassAttemptEvent{
  final int subjectId;
  PassAttemptChangeSubjectEvent(this.subjectId);
  @override
  List<Object?> get props => [subjectId];
}

class PassAttemptAnswerQuestionEvent extends PassAttemptEvent{
  final String answer;
  final int questionId;
  final int typeId;
  PassAttemptAnswerQuestionEvent(this.answer, this.questionId, this.typeId);
  @override
  List<Object?> get props => [typeId,questionId,answer];
}

class PassAttemptAnswerEvent extends PassAttemptEvent {
  final AnswerParameter parameter;
  PassAttemptAnswerEvent(this.parameter);
  @override
  List<Object?> get props => [parameter];
}

class PassAttemptGetAnsweredEvent extends PassAttemptEvent {
  final int attemptSubjectId;
  PassAttemptGetAnsweredEvent(this.attemptSubjectId);
  @override
  List<Object?> get props => [attemptSubjectId];
}

class PassAttemptCarouselSliderChangeEvent extends PassAttemptEvent{
  final int activeSliderId;
  PassAttemptCarouselSliderChangeEvent(this.activeSliderId);
  @override
  List<Object?> get props => [activeSliderId];
}

class PassAttemptFinishAttemptEvent extends PassAttemptEvent{
  final int attemptId;
  PassAttemptFinishAttemptEvent(this.attemptId);
  @override
  List<Object?> get props => [attemptId];

}



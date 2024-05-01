import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';

abstract class PassAttemptEvent extends Equatable {}

class PassAttemptGetByAttemptIdEvent extends PassAttemptEvent {
  final int attemptId;
  PassAttemptGetByAttemptIdEvent(this.attemptId);
  @override
  List<Object?> get props => [];
}

class PassAttemptChangeSubjectEvent extends PassAttemptEvent{
  final int subjectId;
  PassAttemptChangeSubjectEvent(this.subjectId);
  @override
  List<Object?> get props => [];
}

class PassAttemptAnswerQuestionEvent extends PassAttemptEvent{
  final String answer;
  final int questionId;
  final int typeId;
  PassAttemptAnswerQuestionEvent(this.answer, this.questionId, this.typeId);
  @override
  List<Object?> get props => [];
}

class PassAttemptAnswerEvent extends PassAttemptEvent {
  final AnswerParameter parameter;
  PassAttemptAnswerEvent(this.parameter);
  @override
  List<Object?> get props => [];
}

class PassAttemptGetAnsweredEvent extends PassAttemptEvent {
  final int attemptSubjectId;
  PassAttemptGetAnsweredEvent(this.attemptSubjectId);
  @override
  List<Object?> get props => [];
}



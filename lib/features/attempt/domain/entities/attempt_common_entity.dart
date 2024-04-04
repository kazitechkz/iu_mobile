import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';

class AttemptCommonEntity extends Equatable{
  final int attemptId;
  final int typeId;
  final int timeLeft;
  final List<SubjectQuestionEntity> subjectQuestions;
  final String startAt;

  const AttemptCommonEntity({
        required this.attemptId,
        required this.typeId,
        required this.timeLeft,
        required this.subjectQuestions,
        required this.startAt
      });

  @override
  List<Object?> get props => [attemptId,typeId,timeLeft,subjectQuestions,startAt];
}

class SubjectQuestionEntity extends Equatable {
  final String titleRu;
  final String titleKk;
  final List<QuestionEntity> question;
  final int attemptSubjectId;

  const SubjectQuestionEntity({
    required this.titleRu,
    required this.titleKk,
    required this.question,
    required this.attemptSubjectId,
});

  @override
  List<Object?> get props => [titleRu,titleKk,question,attemptSubjectId];



}
import 'package:equatable/equatable.dart';

class AttemptQuestionEntity extends Equatable {
  final int id;
  final int attemptSubjectId;
  final int questionId;
  final int point;
  final bool isRight;
  final String? userAnswer;
  final bool isAnswered;
  final bool isSkipped;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const AttemptQuestionEntity(
      {required this.id,
      required this.attemptSubjectId,
      required this.questionId,
      required this.point,
      required this.isRight,
      this.userAnswer,
      required this.isAnswered,
      required this.isSkipped,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  @override
  List<Object?> get props => [id,attemptSubjectId,questionId,point,isRight,isAnswered,isSkipped];
}

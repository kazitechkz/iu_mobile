import 'package:equatable/equatable.dart';

class AnswerResultEntity extends Equatable {
  final bool isFinished;
  final bool isAnswered;
  final int questionLeft;
  final int questionId;
  final int timeLeft;
  final int? points;

  const AnswerResultEntity({
    required this.isFinished,
    required this.isAnswered,
    required this.questionLeft,
    required this.questionId,
    required this.timeLeft,
    this.points,
  });

  @override
  List<Object?> get props =>
      [isFinished, isAnswered, questionLeft, questionId, timeLeft, points];
}

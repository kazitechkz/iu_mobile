import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/career/domain/entities/career_quiz_attempt_result_entity.dart';
import 'career_quiz_entity.dart';

class CareerQuizAttemptEntity extends Equatable{
  final int id;
  final int userId;
  final int quizId;
  final String givenAnswers;
  final String? createdAt;
  final String? updatedAt;
  final CareerQuizEntity? careerQuiz;
  final OrdinaryUserEntity? user;
  final List<CareerQuizAttemptResultEntity>? careerQuizAttemptResults;

  const CareerQuizAttemptEntity({
    required this.id,
    required this.userId,
    required this.quizId,
    required this.givenAnswers,
    this.createdAt,
    this.updatedAt,
    this.careerQuiz,
    this.user,
    this.careerQuizAttemptResults,
  });

  @override
  List<Object?> get props => [id,userId, quizId, givenAnswers,careerQuiz,user];

}
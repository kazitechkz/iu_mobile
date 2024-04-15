import 'package:equatable/equatable.dart';
import 'package:iu/features/career/data/career_quiz_author_entity.dart';

class CareerQuizCreatorEntity extends Equatable {
  final int id;
  final int quizId;
  final int authorId;
  final String? createdAt;
  final String? updatedAt;
  final CareerQuizAuthorEntity? careerQuizAuthor;
  // career_quiz:CareerQuiz|null

  const CareerQuizCreatorEntity(
      {required this.id,
      required this.quizId,
      required this.authorId,
      this.createdAt,
      this.updatedAt,
      this.careerQuizAuthor});

  @override
  List<Object?> get props => [id, quizId, authorId];
}

import 'package:equatable/equatable.dart';
import 'career_quiz_author_entity.dart';
import 'career_quiz_entity.dart';

class CareerQuizCreatorEntity extends Equatable {
  final int id;
  final int quizId;
  final int authorId;
  final String? createdAt;
  final String? updatedAt;
  final CareerQuizAuthorEntity? careerQuizAuthor;
  final CareerQuizEntity? careerQuiz;

  const CareerQuizCreatorEntity(
      {required this.id,
      required this.quizId,
      required this.authorId,
      this.createdAt,
      this.updatedAt,
      this.careerQuizAuthor,
        this.careerQuiz
      });

  @override
  List<Object?> get props => [id, quizId, authorId,careerQuizAuthor,careerQuiz];
}

import 'package:equatable/equatable.dart';
import 'career_quiz_entity.dart';

class CareerQuizAnswerEntity extends Equatable{
  final int id;
  final int quizId;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final int value;
  final int? questionId;
  final int? featureId;
  final CareerQuizEntity? careerQuiz;

  const CareerQuizAnswerEntity({
    required this.id,
    required this.quizId,
    required this.titleRu,
    required this.titleKk,
    this.titleEn,
    required this.value,
    this.questionId,
    this.featureId,
    this.careerQuiz
});


  @override
  List<Object?> get props => [id,quizId,titleRu,titleKk,titleEn,value,questionId,featureId,careerQuiz];

}
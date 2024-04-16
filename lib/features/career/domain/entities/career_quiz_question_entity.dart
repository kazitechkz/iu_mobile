import 'package:equatable/equatable.dart';
import 'package:iu/features/career/domain/entities/career_quiz_answer_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_feature_entity.dart';
import 'career_quiz_entity.dart';

class CareerQuizQuestionEntity extends Equatable {
  final int id;
  final int quizId;
  final int? featureId;
  final String questionRu;
  final String questionKk;
  final String? questionEn;
  final String? contextRu;
  final String? contextKk;
  final String? contextEn;
  final String? createdAt;
  final String? updatedAt;
  final CareerQuizFeatureEntity? careerQuizFeature;
  final CareerQuizEntity? careerQuiz;
  final List<CareerQuizAnswerEntity>? careerQuizAnswers;

  const CareerQuizQuestionEntity(
      {required this.id,
      required this.quizId,
      this.featureId,
      required this.questionRu,
      required this.questionKk,
      this.questionEn,
      this.contextRu,
      this.contextKk,
      this.contextEn,
      this.createdAt,
      this.updatedAt,
      this.careerQuizFeature,
      this.careerQuiz,
      this.careerQuizAnswers});

  @override
  List<Object?> get props => [
        id,
        quizId,
        featureId,
        questionRu,
        questionKk,
        questionEn,
        contextRu,
        contextKk,
        contextEn,
        createdAt,
        updatedAt,
        careerQuizFeature,
        careerQuiz,
        careerQuizAnswers,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:iu/features/career/domain/entities/career_quiz_attempt_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_feature_entity.dart';

class CareerQuizAttemptResultEntity extends Equatable {
  final int id;
  final int attemptId;
  final int featureId;
  final int points;
  final double percentage;
  final String? createdAt;
  final String? updatedAt;
  final CareerQuizAttemptEntity? careerQuizAttempt;
  final CareerQuizFeatureEntity? careerQuizFeature;

  const CareerQuizAttemptResultEntity(
      {required this.id,
      required this.attemptId,
      required this.featureId,
      required this.points,
      required this.percentage,
      this.createdAt,
      this.updatedAt,
      this.careerQuizAttempt,
      this.careerQuizFeature});

  @override
  List<Object?> get props =>
      [id, attemptId, featureId, points, percentage, createdAt, updatedAt];
}

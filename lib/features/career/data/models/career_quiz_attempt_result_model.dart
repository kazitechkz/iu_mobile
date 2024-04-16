import 'package:equatable/equatable.dart';
import 'package:iu/features/career/data/models/career_quiz_feature_model.dart';
import 'package:iu/features/career/domain/entities/career_quiz_attempt_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_feature_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_attempt_result_entity.dart';
import 'career_quiz_attempt_model.dart';

class CareerQuizAttemptResultModel extends CareerQuizAttemptResultEntity {
  const CareerQuizAttemptResultModel(
      {required super.id,
      required super.attemptId,
      required super.featureId,
      required super.points,
      required super.percentage,
      super.createdAt,
      super.updatedAt,
      CareerQuizAttemptModel? super.careerQuizAttempt,
      CareerQuizFeatureModel? super.careerQuizFeature});

  CareerQuizAttemptResultModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          attemptId: map["attempt_id"],
          featureId: map["feature_id"],
          points: map["points"],
          percentage: map["percentage"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          careerQuizAttempt: map["career_quiz_attempt"] != null
              ? CareerQuizAttemptModel.fromMap(map["career_quiz_attempt"])
              : null,
          careerQuizFeature: map["career_quiz_feature"] != null
              ? CareerQuizFeatureModel.fromMap(map["career_quiz_feature"])
              : null,
        );

  factory CareerQuizAttemptResultModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizAttemptResultModel.fromMap(json);
  }

  static List<CareerQuizAttemptResultModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => CareerQuizAttemptResultModel.fromMap(map))
        .toList();
  }
}

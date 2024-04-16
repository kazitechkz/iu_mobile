import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/career/data/models/career_quiz_answer_model.dart';
import 'package:iu/features/career/data/models/career_quiz_feature_model.dart';
import 'package:iu/features/career/data/models/career_quiz_model.dart';

import '../../domain/entities/career_quiz_question_entity.dart';

class CareerQuizQuestionModel extends CareerQuizQuestionEntity {
  const CareerQuizQuestionModel(
      {required super.id,
      required super.quizId,
      super.featureId,
      required super.questionRu,
      required super.questionKk,
      super.questionEn,
      super.contextRu,
      super.contextKk,
      super.contextEn,
      super.createdAt,
      super.updatedAt,
      CareerQuizFeatureModel? super.careerQuizFeature,
      CareerQuizModel? super.careerQuiz,
      List<CareerQuizAnswerModel>? super.careerQuizAnswers
      });

  CareerQuizQuestionModel.fromMap(DataMap map)
      : this(
      id:map["id"],
    quizId:map["quiz_id"],
    featureId:map["feature_id"],
    questionRu:map["question_ru"],
    questionKk:map["question_kk"],
    questionEn:map["question_en"],
    contextRu:map["context_ru"],
    contextKk:map["context_kk"],
    contextEn:map["context_en"],
    createdAt:map["created_at"],
    updatedAt:map["updated_at"],
    careerQuizFeature:map["career_quiz_feature"] != null ? CareerQuizFeatureModel.fromMap(map["career_quiz_feature"]) : null,
    careerQuiz:map["career_quiz"] != null ? CareerQuizModel.fromMap(map["career_quiz"]) : null,
    careerQuizAnswers:map["career_quiz_answers"] != null ? CareerQuizAnswerModel.fromMapList(map["career_quiz_answers"].cast<Map<String, dynamic>>()) : null,
  );

  factory CareerQuizQuestionModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizQuestionModel.fromMap(json);
  }

  static List<CareerQuizQuestionModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizQuestionModel.fromMap(map)).toList();
  }



}

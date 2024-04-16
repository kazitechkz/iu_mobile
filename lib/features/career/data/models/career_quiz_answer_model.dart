import 'package:equatable/equatable.dart';
import 'package:iu/features/career/data/models/career_quiz_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_answer_entity.dart';

class CareerQuizAnswerModel extends CareerQuizAnswerEntity {
  const CareerQuizAnswerModel(
      {required super.id,
      required super.quizId,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      required super.value,
      super.questionId,
      super.featureId,
      CareerQuizModel? super.careerQuiz});

  CareerQuizAnswerModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          quizId: map["quiz_id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          value: map["value"],
          questionId: map["question_id"],
          featureId: map["feature_id"],
          careerQuiz: map["career_quiz"] != null
              ? CareerQuizModel.fromMap(map["career_quiz"])
              : null,
        );

  factory CareerQuizAnswerModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizAnswerModel.fromMap(json);
  }

  static List<CareerQuizAnswerModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizAnswerModel.fromMap(map)).toList();
  }
}

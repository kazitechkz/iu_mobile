import 'package:equatable/equatable.dart';
import 'package:iu/features/career/data/models/career_quiz_author_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_creator_entity.dart';
import 'career_quiz_model.dart';

class CareerQuizCreatorModel extends CareerQuizCreatorEntity {
  const CareerQuizCreatorModel(
      {required super.id,
      required super.quizId,
      required super.authorId,
      super.createdAt,
      super.updatedAt,
      CareerQuizAuthorModel? super.careerQuizAuthor,
      CareerQuizModel? super.careerQuiz});

  CareerQuizCreatorModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          quizId: map["quiz_id"],
          authorId: map["author_id"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          careerQuizAuthor: map["career_quiz_author"] != null
              ? CareerQuizAuthorModel.fromMap(map["career_quiz_author"])
              : null,
          careerQuiz: map["career_quiz"] != null
              ? CareerQuizModel.fromMap(map["career_quiz"])
              : null,
        );

  factory CareerQuizCreatorModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizCreatorModel.fromMap(json);
  }

  static List<CareerQuizCreatorModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizCreatorModel.fromMap(map)).toList();
  }
}

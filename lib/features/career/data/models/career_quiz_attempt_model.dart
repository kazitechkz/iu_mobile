import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/career/data/models/career_quiz_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_attempt_entity.dart';
import 'career_quiz_attempt_result_model.dart';

class CareerQuizAttemptModel extends CareerQuizAttemptEntity {
  const CareerQuizAttemptModel({
    required super.id,
    required super.userId,
    required super.quizId,
    required super.givenAnswers,
    super.createdAt,
    super.updatedAt,
    CareerQuizModel? super.careerQuiz,
    OrdinaryUserModel? super.user,
    List<CareerQuizAttemptResultModel>? super.careerQuizAttemptResults,
  });

  CareerQuizAttemptModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          userId: map["user_id"],
          quizId: map["quiz_id"],
          givenAnswers: map["given_answers"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          careerQuiz: map["career_quiz"] != null
              ? CareerQuizModel.fromMap(map["career_quiz"])
              : null,
          user: map["user"] != null
              ? OrdinaryUserModel.fromMap(map["user"])
              : null,
          careerQuizAttemptResults: map["career_quiz_attempt_results"] != null
              ? CareerQuizAttemptResultModel.fromMapList(
                  map["career_quiz_attempt_results"]
                      .cast<Map<String, dynamic>>())
              : null,
        );

  factory CareerQuizAttemptModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizAttemptModel.fromMap(json);
  }

  static List<CareerQuizAttemptModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizAttemptModel.fromMap(map)).toList();
  }
}

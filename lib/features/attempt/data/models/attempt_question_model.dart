import 'package:iu/features/attempt/data/models/attempt_common_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/attempt_question_entity.dart';

class AttemptQuestionModel extends AttemptQuestionEntity {
  const AttemptQuestionModel(
      {required super.id,
      required super.attemptSubjectId,
      required super.questionId,
      required super.point,
      required super.isRight,
      super.userAnswer,
      required super.isAnswered,
      required super.isSkipped,
      super.createdAt,
      super.updatedAt,
      super.deletedAt});

  factory AttemptQuestionModel.fromJson(Map<String, dynamic> json) {
    return AttemptQuestionModel.fromMap(json);
  }

  AttemptQuestionModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          attemptSubjectId: map["attempt_subject_id"],
          questionId: map["question_id"],
          point: map["point"],
          isRight: map["is_right"],
          userAnswer: map["user_answer"],
          isAnswered: map["is_answered"],
          isSkipped: map["is_skipped"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
        );

  static List<AttemptQuestionModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => AttemptQuestionModel.fromMap(map)).toList();
  }
}

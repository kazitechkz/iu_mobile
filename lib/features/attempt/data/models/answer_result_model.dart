import 'package:iu/features/attempt/domain/entities/answer_result_entity.dart';

import '../../../../core/utils/typedef.dart';

class AnswerResultModel extends AnswerResultEntity {
  const AnswerResultModel({
    required super.isFinished,
    required super.isAnswered,
    required super.questionLeft,
    required super.questionId,
    required super.timeLeft,
    super.points,
  });

  factory AnswerResultModel.fromJson(Map<String, dynamic> json) {
    return AnswerResultModel.fromMap(json);
  }

  AnswerResultModel.fromMap(DataMap map)
      : this(
          isFinished: map["is_finished"],
          isAnswered: map["is_answered"],
          questionLeft: map["question_left"],
          questionId: map["question_id"],
          timeLeft: map["time_left"],
          points: map["points"],
        );

  static List<AnswerResultModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => AnswerResultModel.fromMap(map)).toList();
  }
}

import 'package:iu/features/attempt/data/models/attempt_common_model.dart';
import 'package:iu/features/attempt/domain/entities/attempt_common_entity.dart';

import '../../../../core/utils/typedef.dart';

class AttemptQuestionModel extends AttemptCommonEntity{
  const AttemptQuestionModel({
    required super.attemptId,
    required super.typeId,
    required super.timeLeft,
    required List<SubjectQuestionModel> super.subjectQuestions,
    required super.startAt
  });

  factory AttemptQuestionModel.fromJson(Map<String, dynamic> json){
    return AttemptQuestionModel.fromMap(json);
  }

  AttemptQuestionModel.fromMap(DataMap map)
      : this(
      attemptId: map["attempt_id"],
      typeId: map["type_id"],
      timeLeft: map["time_left"],
      subjectQuestions: SubjectQuestionModel.fromMapList(map["subject_questions"]),
      startAt: map["start_at"],
  );

  static List<AttemptQuestionModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => AttemptQuestionModel.fromMap(map)).toList();
  }

}
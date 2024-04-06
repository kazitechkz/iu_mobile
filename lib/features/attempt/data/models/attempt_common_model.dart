import 'package:iu/features/attempt/data/models/question_model.dart';
import 'package:iu/features/attempt/domain/entities/attempt_common_entity.dart';
import '../../../../core/utils/typedef.dart';

class AttemptCommonModel extends AttemptCommonEntity {
  const AttemptCommonModel(
      {required super.attemptId,
      required super.typeId,
      required super.timeLeft,
      required List<SubjectQuestionModel> super.subjectQuestions,
      required super.startAt});

  factory AttemptCommonModel.fromJson(Map<String, dynamic> json) {
    return AttemptCommonModel.fromMap(json);
  }

  AttemptCommonModel.fromMap(DataMap map)
      : this(
          attemptId: map["attempt_id"],
          typeId: map["type_id"],
          timeLeft: map["time_left"],
          subjectQuestions: SubjectQuestionModel.fromMapList(
              map["subject_questions"].cast<Map<String, dynamic>>()),
          startAt: map["start_at"],
        );

  static List<AttemptCommonModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => AttemptCommonModel.fromMap(map)).toList();
  }
}

class SubjectQuestionModel extends SubjectQuestionEntity {
  const SubjectQuestionModel(
      {required super.titleRu,
      required super.titleKk,
      required List<QuestionModel> super.question,
      required super.attemptSubjectId});

  factory SubjectQuestionModel.fromJson(Map<String, dynamic> json) {
    return SubjectQuestionModel.fromMap(json);
  }

  SubjectQuestionModel.fromMap(DataMap map)
      : this(
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          question: QuestionModel.fromMapList(
              map["question"].cast<Map<String, dynamic>>()),
          attemptSubjectId: map["attempt_subject_id"],
        );

  static List<SubjectQuestionModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubjectQuestionModel.fromMap(map)).toList();
  }
}

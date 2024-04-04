import 'package:iu/features/attempt/domain/entities/attempt_common_entity.dart';
import '../../../../core/utils/typedef.dart';

class AttemptCommonModel extends AttemptCommonEntity{
  const AttemptCommonModel({required super.attemptId, required super.typeId, required super.timeLeft, required super.subjectQuestions, required super.startAt});

}

class SubjectQuestionModel extends SubjectQuestionEntity{
  const SubjectQuestionModel({required super.titleRu, required super.titleKk, required super.question, required super.attemptSubjectId});

  factory SubjectQuestionModel.fromJson(Map<String, dynamic> json){
    return SubjectQuestionModel.fromMap(json);
  }

  SubjectQuestionModel.fromMap(DataMap map)
      : this(
      titleRu:map["title_ru"],
      titleKk:map["title_kk"],
      question:map["question"],
      attemptSubjectId:map["attempt_subject_id"],
  );

  static List<SubjectQuestionModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubjectQuestionModel.fromMap(map)).toList();
  }


}
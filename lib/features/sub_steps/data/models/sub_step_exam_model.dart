import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/data/models/question_model.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_exam_question_model.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_exam_result_model.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_exam_entity.dart';

class SubStepExamModel extends SubStepExamEntity {
  const SubStepExamModel({required super.id, required super.sub_step_id, required super.question, required super.question_id, required super.result});

  factory SubStepExamModel.fromJson(DataMap json) {
    return SubStepExamModel(
        id: json['id'] as int,
        sub_step_id: json['sub_step_id'] as int,
        question: SubStepExamQuestionModel.fromJson(json['question']),
        question_id: json['question_id'] as int,
        result: json['result'] != null ? SubStepExamResultModel.fromJson(json['result']) : null
    );
  }

  static List<SubStepExamModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubStepExamModel.fromJson(map)).toList();
  }
}
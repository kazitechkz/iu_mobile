import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_exam_model.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_result_exam_entity.dart';

class SubStepExamResultModel extends SubStepExamResultEntity {
  const SubStepExamResultModel({required super.count, required super.isRight, required super.subStepExamEntity});

  factory SubStepExamResultModel.fromJson(Map<String, dynamic> json) {
    return SubStepExamResultModel(
        isRight: json['is_right'] as int,
        count: json['count'] as int,
        subStepExamEntity: SubStepExamModel.fromMapList(json['questions'].cast<DataMap>())
    );
  }
  
  static List<SubStepExamResultModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubStepExamResultModel.fromJson(map)).toList();
  }
}

class SubStepExamResultAnsweredModel extends SubStepExamResultAnsweredEntity {
  const SubStepExamResultAnsweredModel({required super.id, required super.isRight, required super.answer});
  factory SubStepExamResultAnsweredModel.fromJson(Map<String, dynamic> json) {
    return SubStepExamResultAnsweredModel(
        id: json['id'] as int,
        isRight: json['is_right'] as bool,
        answer: json['user_answer'] as String
    );
  }

  static List<SubStepExamResultAnsweredModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubStepExamResultAnsweredModel.fromJson(map)).toList();
  }
}
import 'package:iu/features/sub_steps/domain/entities/sub_step_result_exam_entity.dart';

class SubStepExamResultModel extends SubStepExamResultEntity {
  const SubStepExamResultModel({required super.id, required super.is_right, required super.user_answer});

  factory SubStepExamResultModel.fromJson(Map<String, dynamic> json) {
    return SubStepExamResultModel(
        id: json['id'] as int,
        is_right: json['is_right'] as bool,
        user_answer: json['user_answer'] as String
    );
  }
  
  static List<SubStepExamResultModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubStepExamResultModel.fromJson(map)).toList();
  }
}
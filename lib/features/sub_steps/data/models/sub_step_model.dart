import 'package:iu/features/sub_steps/data/models/sub_result_model.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_content_model.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_video.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';

import '../../../steps/data/models/step_model.dart';

class SubStepModel extends SubStepEntity {
  const SubStepModel(
      {required super.id,
      required super.titleRu,
      required super.titleKk,
      required super.stepId,
      required super.subCategoryId,
      required super.level,
      required super.isActive,
      required super.createdAt,
      required super.updatedAt,
      required super.isFree,
      required super.progressKk,
      required super.progressRu,
      required super.step,
      super.subStepContentEntity,
      super.subStepVideoEntity,
      super.subResultEntity});

  factory SubStepModel.fromJson(Map<String, dynamic> json) {
    return SubStepModel(
      id: json['id'] ?? 0,
      titleRu: json['title_ru'] ?? '',
      titleKk: json['title_kk'] ?? '',
      stepId: json['step_id'] ?? 0,
      subCategoryId: json['subCategory_id'] ?? 0,
      level: json['level'] ?? 0,
      isActive: json['isActive'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      isFree: json['isFree'] ?? false,
      progressKk: json['progressKk'] ?? 0,
      progressRu: json['progressRu'] ?? 0,
      step: StepModel.fromJson(json['step'] ?? {}),
      subStepContentEntity: json['sub_step_content'] != null ? SubStepContentModel.fromJson(json['sub_step_content']) : null,
      subStepVideoEntity: json['sub_step_video'] != null ? SubStepVideoModel.fromJson(json['sub_step_video']) : null,
      subResultEntity: json['sub_result'] != null ? SubResultModel.fromMapList(json['sub_result'].cast<Map<String, dynamic>>()) : null,
    );
  }

  static List<SubStepModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubStepModel.fromJson(map)).toList();
  }
}
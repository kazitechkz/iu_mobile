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
      titleRu: json['titleRu'] ?? '',
      titleKk: json['titleKk'] ?? '',
      stepId: json['stepId'] ?? 0,
      subCategoryId: json['subCategoryId'] ?? 0,
      level: json['level'] ?? 0,
      isActive: json['isActive'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
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

class SubStepContentModel extends SubStepContentEntity {
  const SubStepContentModel(
      {required super.id,
      required super.text_kk,
      required super.text_ru,
      required super.is_active});

  factory SubStepContentModel.fromJson(Map<String, dynamic> json) {
    return SubStepContentModel(
        id: json['id'] as int,
        text_kk: json['text_kk'] as String,
        text_ru: json['text_ru'] as String,
        is_active: json['is_active'] as int);
  }
}

class SubStepVideoModel extends SubStepVideoEntity {
  const SubStepVideoModel(
      {required super.id, required super.sub_step_id, required super.url});

  factory SubStepVideoModel.fromJson(Map<String, dynamic> json) {
    return SubStepVideoModel(
        id: json['id'] as int,
        sub_step_id: json['sub_step_id'] as int,
        url: json['url'] as String);
  }
}

class SubResultModel extends SubResultEntity {
  const SubResultModel({required super.id, required super.locale_id, required super.sub_step_id, required super.user_id, required super.user_point});

  factory SubResultModel.fromJson(Map<String, dynamic> json) {
    return SubResultModel(
        id: json['id'] as int,
        locale_id: json['locale_id'] as int,
        sub_step_id: json['sub_step_id'] as int,
        user_id: json['user_id'] as int,
        user_point: json['user_point'] as String
    );
  }

  static List<SubResultModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubResultModel.fromJson(map)).toList();
  }
}

import 'package:equatable/equatable.dart';

import '../../../steps/data/models/step_model.dart';

class SubStepEntity extends Equatable {
  final int id;
  final String titleRu;
  final String titleKk;
  final int stepId;
  final int subCategoryId;
  final int level;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final bool isFree;
  final int? progressKk;
  final int? progressRu;
  final StepModel step;
  final SubStepContentEntity? subStepContentEntity;
  final SubStepVideoEntity? subStepVideoEntity;
  final List<SubResultEntity>? subResultEntity;

  const SubStepEntity(
      {required this.id,
        required this.titleRu,
        required this.titleKk,
        required this.stepId,
        required this.subCategoryId,
        required this.level,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.isFree,
        this.progressKk,
        this.progressRu,
        this.subStepContentEntity,
        this.subStepVideoEntity,
        this.subResultEntity,
        required this.step});

  @override
  List<Object?> get props => [
    id, titleKk, titleRu, stepId, subCategoryId, level, isActive, createdAt, updatedAt, isFree, progressKk, progressRu, step, subStepVideoEntity, subResultEntity, subStepContentEntity
  ];
}

class SubStepContentEntity extends Equatable {
  final int id;
  final String text_ru;
  final String text_kk;
  final int is_active;

  const SubStepContentEntity({
    required this.id,
    required this.text_kk,
    required this.text_ru,
    required this.is_active
  });

  @override
  List<Object?> get props => [id, text_kk, text_ru, is_active];
}

class SubStepVideoEntity extends Equatable {
  final int id;
  final int sub_step_id;
  final String url;

  const SubStepVideoEntity({
    required this.id,
    required this.sub_step_id,
    required this.url
});

  @override
  List<Object?> get props => [id, sub_step_id, url];
}

class SubResultEntity extends Equatable {
  final int id;
  final int locale_id;
  final int sub_step_id;
  final int user_id;
  final String user_point;

  const SubResultEntity({
    required this.id,
    required this.locale_id,
    required this.sub_step_id,
    required this.user_id,
    required this.user_point
});

  @override
  List<Object?> get props => [id, locale_id, sub_step_id, user_id, user_point];

}
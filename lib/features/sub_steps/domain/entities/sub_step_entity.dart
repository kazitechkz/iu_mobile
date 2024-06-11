import 'package:equatable/equatable.dart';
import 'package:iu/core/mixins/progress_mixin.dart';
import 'package:iu/core/mixins/title_mixin.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_result_entity.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_content_entity.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_video_entity.dart';

import '../../../steps/data/models/step_model.dart';

class SubStepEntity extends Equatable with TitleMixin, ProgressMixin {
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

  @override
  int? getProgressKk() => progressKk;

  @override
  int? getProgressRu() => progressRu;

  @override
  String? getTitleKk() => titleKk;

  @override
  String? getTitleRu() => titleRu;
}
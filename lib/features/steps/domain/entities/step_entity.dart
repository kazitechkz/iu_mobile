import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/mixins/title_mixin.dart';

import '../../../../core/mixins/progress_mixin.dart';

class StepEntity extends Equatable with TitleMixin, ProgressMixin {
  final int id;
  final String title_kk;
  final String title_ru;
  final int subject_id;
  final int category_id;
  final int plan_id;
  final int level;
  final bool is_free;
  final bool is_active;
  final int? image_url;
  final FileEntity? image;
  final int? progress_kk;
  final int? progress_ru;
  final SubjectEntity? subject;

  const StepEntity({
    required this.id,
    required this.title_kk,
    required this.title_ru,
    required this.subject_id,
    required this.category_id,
    required this.plan_id,
    required this.level,
    required this.is_free,
    required this.is_active,
    this.image,
    this.image_url,
    this.progress_kk,
    this.progress_ru,
    this.subject
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title_kk, title_ru, image, subject_id, category_id, plan_id, level, is_free, is_active, progress_kk, progress_ru, subject, image_url];

  @override
  String? getTitleKk() => title_kk;

  @override
  String? getTitleRu() => title_ru;

  @override
  int? getProgressKk() => progress_kk;

  @override
  int? getProgressRu() => progress_ru;
}

class MainStepEntity extends SubjectEntity {
  final int steps_count;
  final int sub_steps_count;
  final int progress;
  final FileEntity? image;
  final int? image_url;
  const MainStepEntity({
    this.image_url,
    this.image,
    required this.steps_count,
    required this.sub_steps_count,
    required this.progress,
    required super.id,
    required super.title_kk,
    required super.title_ru,
    required super.enable,
    required super.is_compulsory,
    required super.max_questions_quantity,
    required super.questions_step,
    super.created_at,
    super.updated_at
  });
}

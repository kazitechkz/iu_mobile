import 'dart:convert';

import '../../../../core/common/models/file_entity.dart';
import '../../../../core/common/models/subject.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/step_entity.dart';

class StepModel extends StepEntity {
  const StepModel({
    required super.id,
    required super.title_kk,
    required super.title_ru,
    required super.subject_id,
    required super.category_id,
    required super.plan_id,
    required super.level,
    required super.is_free,
    required super.is_active,
    super.image,
     super.progress_kk,
     super.progress_ru,
    super.subject
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel.fromMap(json);
  }

  StepModel.fromMap(DataMap map)
      : this(
      id: map['id'] as int,
      title_kk: map['title_kk'] as String,
      title_ru: map['title_ru'] as String,
      subject_id: map['subject_id'] as int,
      category_id: map['category_id'] as int,
      plan_id: map['plan_id'] as int,
      level: map['level'] as int,
      is_free: map['is_free'] as int,
      is_active: map['is_active'] as int,
      image: map["image"] != null ? FileModel.fromJson(map["image"]) : null,
      progress_kk: map['progress'] as int,
      progress_ru: map['progress'] as int,
      subject: map['subject'] as SubjectEntity
  );

  DataMap toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title_kk'] = title_kk;
    data['title_ru'] = title_ru;
    data['subject_id'] = subject_id;
    data['category_id'] = category_id;
    data['plan_id'] = plan_id;
    data['level'] = level;
    data['is_free'] = is_free;
    data['is_active'] = is_active;
    data['image'] = image;
    data['progress_kk'] = progress_kk;
    data['progress_ru'] = progress_ru;
    data['subject'] = subject;
    return data;
  }

}

class MainStepModel extends MainStepEntity {
  const MainStepModel({
    required super.steps_count,
    required super.sub_steps_count,
    required super.progress,
    required super.id,
    required super.title_kk,
    required super.title_ru,
    required super.enable,
    required super.is_compulsory,
    required super.max_questions_quantity,
    required super.questions_step,
    required super.created_at,
    required super.updated_at,
    super.image,
    super.image_url
  });

  factory MainStepModel.fromJson(String json) {
    DataMap data = jsonDecode(json) as DataMap;
    return MainStepModel.fromMap(data);
  }

  MainStepModel.fromMap(DataMap map)
      : this(
      id: map['id'] as int,
      title_kk: map['title_kk'] as String,
      title_ru: map['title_ru'] as String,
      steps_count: map['steps_count'] as int,
      sub_steps_count: map['sub_steps_count'] as int,
      progress: map['progress'] as int,
      enable: map['enable'] as int,
      image: map["image"] != null ? FileModel.fromJson(map["image"]) : null,
      image_url: map['image_url'] as int,
      is_compulsory: map['is_compulsory'] as int,
      max_questions_quantity: map['max_questions_quantity'] as int,
      questions_step: map['questions_step'] as int,
      created_at: map['created_at'] as dynamic,
      updated_at: map['updated_at'] as dynamic,
  );
}
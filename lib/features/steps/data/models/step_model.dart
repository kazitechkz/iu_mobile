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
      level: 1,
      is_free: 1,
      is_active: 1,
      image: map['image'] as FileEntity,
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
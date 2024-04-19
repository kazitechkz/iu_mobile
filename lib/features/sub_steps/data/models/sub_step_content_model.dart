
import '../../domain/entities/sub_step_content_entity.dart';

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
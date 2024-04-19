import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/fact/domain/entities/fact_entity.dart';

class FactModel extends FactEntity {
  const FactModel({required super.id, required super.subjectId, required super.subject, required super.text_kk, required super.text_ru});

  factory FactModel.fromJson(DataMap json) {
    return FactModel(
        id: json['id'] as int,
        subjectId: json['subject_id'] as int,
        subject: SubjectModel.fromMap(json['subject']),
        text_kk: json['text_kk'] as String,
        text_ru: json['text_ru'] as String
    );
  }
}
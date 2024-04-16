import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_feature_entity.dart';

class CareerQuizFeatureModel extends CareerQuizFeatureEntity {
  const CareerQuizFeatureModel(
      {required super.id,
      super.imageUrl,
      required super.quizId,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      required super.descriptionRu,
      required super.descriptionKk,
      super.descriptionEn,
      required super.activityRu,
      required super.activityKk,
      super.activityEn,
      required super.prospectRu,
      required super.prospectKk,
      super.prospectEn,
      required super.meaningRu,
      required super.meaningKk,
      super.meaningEn,
      super.createdAt,
      super.updatedAt,
      FileModel? super.file});

  CareerQuizFeatureModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          imageUrl: map["image_url"],
          quizId: map["quiz_id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          descriptionRu: map["description_ru"],
          descriptionKk: map["description_kk"],
          descriptionEn: map["description_en"],
          activityRu: map["activity_ru"],
          activityKk: map["activity_kk"],
          activityEn: map["activity_en"],
          prospectRu: map["prospect_ru"],
          prospectKk: map["prospect_kk"],
          prospectEn: map["prospect_en"],
          meaningRu: map["meaning_ru"],
          meaningKk: map["meaning_kk"],
          meaningEn: map["meaning_en"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          file: map["file"] != null ? FileModel.fromMap(map["file"]) : null,
        );

  factory CareerQuizFeatureModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizFeatureModel.fromMap(json);
  }

  static List<CareerQuizFeatureModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizFeatureModel.fromMap(map)).toList();
  }
}

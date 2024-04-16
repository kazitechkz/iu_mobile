import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/features/career/data/models/career_quiz_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_author_entity.dart';

class CareerQuizAuthorModel extends CareerQuizAuthorEntity {
  const CareerQuizAuthorModel({
    required super.id,
    required super.groupId,
    super.imageUrl,
    required super.name,
    required super.positionRu,
    required super.positionKk,
    required super.descriptionRu,
    required super.descriptionKk,
    super.instagramUrl,
    super.facebookUrl,
    super.vkUrl,
    super.linkedinUrl,
    super.site,
    super.email,
    super.phone,
    super.createdAt,
    super.updatedAt,
    FileModel? super.file,
    CareerQuizModel? super.careerQuiz,
  });

  CareerQuizAuthorModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          groupId: map["group_id"],
          imageUrl: map["image_url"],
          name: map["name"],
          positionRu: map["position_ru"],
          positionKk: map["position_kk"],
          descriptionRu: map["description_ru"],
          descriptionKk: map["description_kk"],
          instagramUrl: map["instagram_url"],
          facebookUrl: map["facebook_url"],
          vkUrl: map["vk_url"],
          linkedinUrl: map["linkedin_url"],
          site: map["site"],
          email: map["email"],
          phone: map["phone"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          file: map["file"] != null ? FileModel.fromMap(map["file"]) : null,
          careerQuiz: map["career_quiz"] != null
              ? CareerQuizModel.fromMap(map["career_quiz"])
              : null,
        );

  factory CareerQuizAuthorModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizAuthorModel.fromMap(json);
  }

  static List<CareerQuizAuthorModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizAuthorModel.fromMap(map)).toList();
  }
}

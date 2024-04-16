import 'package:iu/features/career/data/models/career_quiz_author_model.dart';
import 'package:iu/features/career/data/models/career_quiz_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_group_entity.dart';

class CareerQuizGroupModel extends CareerQuizGroupEntity {
  const CareerQuizGroupModel(
      {required super.id,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      required super.descriptionRu,
      required super.descriptionKk,
      super.descriptionEn,
      super.email,
      super.phone,
      super.address,
      required super.price,
      super.oldPrice,
      required super.currency,
      super.createdAt,
      super.updatedAt,
      List<CareerQuizAuthorModel>? super.careerQuizAuthors,
      List<CareerQuizModel>? super.careerQuizzes});

  CareerQuizGroupModel.fromMap(DataMap map)
      : this(
            id: map["id"],
            titleRu: map["title_ru"],
            titleKk: map["title_kk"],
            titleEn: map["title_en"],
            descriptionRu: map["description_ru"],
            descriptionKk: map["description_kk"],
            descriptionEn: map["description_en"],
            email: map["email"],
            phone: map["phone"],
            address: map["address"],
            price: map["price"],
            oldPrice: map["old_price"],
            currency: map["currency"],
            createdAt: map["created_at"],
            updatedAt: map["updated_at"],
            careerQuizAuthors: map["career_quiz_authors"] != null
                ? CareerQuizAuthorModel.fromMapList(
                    map["career_quiz_authors"].cast<Map<String, dynamic>>())
                : null,
            careerQuizzes: map["career_quizzes"] != null
                ? CareerQuizModel.fromMapList(
                    map["career_quizzes"].cast<Map<String, dynamic>>())
                : null);

  factory CareerQuizGroupModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizGroupModel.fromMap(json);
  }

  static List<CareerQuizGroupModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizGroupModel.fromMap(map)).toList();
  }
}

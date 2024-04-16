import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/features/career/data/models/career_quiz_answer_model.dart';
import 'package:iu/features/career/data/models/career_quiz_creator_model.dart';
import 'package:iu/features/career/data/models/career_quiz_group_model.dart';
import 'package:iu/features/career/data/models/career_quiz_question_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/career_quiz_entity.dart';

class CareerQuizModel extends CareerQuizEntity {
  const CareerQuizModel(
      {required super.id,
      required super.groupId,
      super.imageUrl,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      required super.descriptionRu,
      required super.descriptionKk,
      super.descriptionEn,
      required super.ruleRu,
      required super.ruleKk,
      super.ruleEn,
      required super.price,
      super.order,
      super.oldPrice,
      required super.currency,
      required super.code,
      super.createdAt,
      super.updatedAt,
      super.careerQuizQuestionsCount,
      super.file,
      CareerQuizGroupModel? super.careerQuizGroup,
      List<CareerQuizCreatorModel>? super.careerQuizCreators,
      List<CareerQuizQuestionModel>? super.careerQuizQuestions,
      List<CareerQuizAnswerModel>? super.careerQuizAnswers});

  CareerQuizModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          groupId: map["group_id"],
          imageUrl: map["image_url"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          descriptionRu: map["description_ru"],
          descriptionKk: map["description_kk"],
          descriptionEn: map["description_en"],
          ruleRu: map["rule_ru"],
          ruleKk: map["rule_kk"],
          ruleEn: map["rule_en"],
          price: map["price"],
          order: map["order"],
          oldPrice: map["oldPrice"],
          currency: map["currency"],
          code: map["code"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          careerQuizQuestionsCount: map["career_quiz_questions_count"],
          file: map["file"] != null ? FileModel.fromMap(map["file"]) : null,
          careerQuizGroup: map["career_quiz_group"] != null
              ? CareerQuizGroupModel.fromMap(map["career_quiz_group"])
              : null,
          careerQuizCreators: map["career_quiz_creators"] != null
              ? CareerQuizCreatorModel.fromMapList(
                  map["career_quiz_creators"].cast<Map<String, dynamic>>())
              : null,
          careerQuizQuestions: map["career_quiz_questions"] != null
              ? CareerQuizQuestionModel.fromMapList(
                  map["career_quiz_questions"].cast<Map<String, dynamic>>())
              : null,
          careerQuizAnswers: map["career_quiz_answers"] != null
              ? CareerQuizAnswerModel.fromMapList(
                  map["career_quiz_answers"].cast<Map<String, dynamic>>())
              : null,
        );

  factory CareerQuizModel.fromJson(Map<String, dynamic> json) {
    return CareerQuizModel.fromMap(json);
  }

  static List<CareerQuizModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CareerQuizModel.fromMap(map)).toList();
  }
}

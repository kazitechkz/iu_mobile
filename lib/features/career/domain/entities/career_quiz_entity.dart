import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_answer_entity.dart';
import 'career_quiz_creator_entity.dart';
import 'career_quiz_group_entity.dart';
import 'career_quiz_question_entity.dart';

class CareerQuizEntity extends Equatable {


  const CareerQuizEntity(
      {required this.id,
      required this.groupId,
      this.imageUrl,
      required this.titleRu,
      required this.titleKk,
      this.titleEn,
      required this.descriptionRu,
      required this.descriptionKk,
      this.descriptionEn,
      required this.ruleRu,
      required this.ruleKk,
      this.ruleEn,
      required this.price,
      this.order,
      this.oldPrice,
      required this.currency,
      required this.code,
      this.createdAt,
      this.updatedAt,
      this.careerQuizQuestionsCount,
      this.file,
      this.careerQuizGroup,
      this.careerQuizCreators,
      this.careerQuizQuestions,
      this.careerQuizAnswers});

  final int id;
  final int groupId;
  final int? imageUrl;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final String descriptionRu;
  final String descriptionKk;
  final String? descriptionEn;
  final String ruleRu;
  final String ruleKk;
  final String? ruleEn;
  final int price;
  final int? order;
  final int? oldPrice;
  final String currency;
  final String code;
  final String? createdAt;
  final String? updatedAt;
  final int? careerQuizQuestionsCount;
  final FileEntity? file;
  final CareerQuizGroupEntity? careerQuizGroup;
  final List<CareerQuizCreatorEntity>? careerQuizCreators;
  final List<CareerQuizQuestionEntity>? careerQuizQuestions;
  final List<CareerQuizAnswerEntity>? careerQuizAnswers;

  @override
  List<Object?> get props => [
        id,
        groupId,
        titleRu,
        titleKk,
        descriptionRu,
        descriptionKk,
        ruleRu,
        ruleKk,
        price,
        currency,
        code
      ];
}

import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/features/career/data/career_quiz_creator_entity.dart';
import 'package:iu/features/career/data/career_quiz_group_entity.dart';

class CareerQuizEntity extends Equatable {
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

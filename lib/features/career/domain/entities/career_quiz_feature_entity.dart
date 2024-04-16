import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';

class CareerQuizFeatureEntity extends Equatable {
  final int id;
  final int? imageUrl;
  final int quizId;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final String descriptionRu;
  final String descriptionKk;
  final String? descriptionEn;
  final String activityRu;
  final String activityKk;
  final String? activityEn;
  final String prospectRu;
  final String prospectKk;
  final String? prospectEn;
  final String meaningRu;
  final String meaningKk;
  final String? meaningEn;
  final String? createdAt;
  final String? updatedAt;
  final FileModel? file;

  const CareerQuizFeatureEntity(
      {required this.id,
      this.imageUrl,
      required this.quizId,
      required this.titleRu,
      required this.titleKk,
      this.titleEn,
      required this.descriptionRu,
      required this.descriptionKk,
      this.descriptionEn,
      required this.activityRu,
      required this.activityKk,
      this.activityEn,
      required this.prospectRu,
      required this.prospectKk,
      this.prospectEn,
      required this.meaningRu,
      required this.meaningKk,
      this.meaningEn,
      this.createdAt,
      this.updatedAt,
      this.file});



  @override
  List<Object?> get props => [
        id,
        imageUrl,
        quizId,
        titleRu,
        titleKk,
        titleEn,
        descriptionRu,
        descriptionKk,
        descriptionEn,
        activityRu,
        activityKk,
        activityEn,
        prospectRu,
        prospectKk,
        prospectEn,
        meaningRu,
        meaningKk,
        meaningEn,
        createdAt,
        updatedAt,
        file,
      ];
}

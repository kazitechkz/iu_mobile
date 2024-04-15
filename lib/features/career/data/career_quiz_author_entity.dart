import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/features/career/data/career_quiz_entity.dart';

class CareerQuizAuthorEntity extends Equatable {
  const CareerQuizAuthorEntity({
    required this.id,
    required this.groupId,
    this.imageUrl,
    required this.name,
    required this.positionRu,
    required this.positionKk,
    required this.descriptionRu,
    required this.descriptionKk,
    this.instagramUrl,
    this.facebookUrl,
    this.vkUrl,
    this.linkedinUrl,
    this.site,
    this.email,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.file,
    this.careerQuiz,
  });

  final int id;
  final int groupId;
  final int? imageUrl;
  final String name;
  final String positionRu;
  final String positionKk;
  final String descriptionRu;
  final String descriptionKk;
  final String? instagramUrl;
  final String? facebookUrl;
  final String? vkUrl;
  final String? linkedinUrl;
  final String? site;
  final String? email;
  final String? phone;
  final String? createdAt;
  final String? updatedAt;
  final FileEntity? file;
  final CareerQuizEntity? careerQuiz;

  @override
  List<Object?> get props => [
        id,
        groupId,
        imageUrl,
        name,
        positionRu,
        positionKk,
        descriptionRu,
        descriptionKk
      ];
}

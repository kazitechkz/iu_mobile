import 'package:equatable/equatable.dart';
import 'career_quiz_author_entity.dart';
import 'career_quiz_entity.dart';

class CareerQuizGroupEntity extends Equatable {
  final int id;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final String descriptionRu;
  final String descriptionKk;
  final String? descriptionEn;
  final String? email;
  final String? phone;
  final String? address;
  final int price;
  final int? oldPrice;
  final String currency;
  final String? createdAt;
  final String? updatedAt;
  final List<CareerQuizAuthorEntity>? careerQuizAuthors;
  final List<CareerQuizEntity>? careerQuizzes;

  const CareerQuizGroupEntity(
      {required this.id,
      required this.titleRu,
      required this.titleKk,
      this.titleEn,
      required this.descriptionRu,
      required this.descriptionKk,
      this.descriptionEn,
      this.email,
      this.phone,
      this.address,
      required this.price,
      this.oldPrice,
      required this.currency,
      this.createdAt,
      this.updatedAt,
      this.careerQuizAuthors,
      this.careerQuizzes});

  @override
  List<Object?> get props => [
        id,
        titleRu,
        titleKk,
        titleEn,
        descriptionRu,
        descriptionKk,
        descriptionEn,
        email,
        phone,
        address,
        price,
        oldPrice,
        currency,
        createdAt,
        updatedAt,
        careerQuizAuthors,
        careerQuizzes
      ];
}

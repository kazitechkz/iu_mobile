import 'package:equatable/equatable.dart';

import 'career_quiz_author_entity.dart';

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
  // career_quiz_authors:CareerQuizAuthor[]|null
  // career_quizzes:CareerQuiz[]|null
}

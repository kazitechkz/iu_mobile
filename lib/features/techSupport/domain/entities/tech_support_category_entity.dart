import 'package:equatable/equatable.dart';

class TechSupportCategoryEntity extends Equatable {
  final int id;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final String? createdAt;
  final String? updatedAt;

  const TechSupportCategoryEntity(
      {required this.id,
      required this.titleRu,
      required this.titleKk,
      this.titleEn,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props =>
      [id, titleRu, titleKk, titleEn, createdAt, updatedAt];
}

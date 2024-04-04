import 'package:equatable/equatable.dart';

class AttemptTypeEntity extends Equatable{
  final int? id;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const AttemptTypeEntity({
    required this.id,
    required this.titleRu,
    required this.titleKk,
    this.titleEn,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [titleRu,titleKk,titleEn,deletedAt,createdAt,updatedAt];

}
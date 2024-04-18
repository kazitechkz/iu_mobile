import 'package:equatable/equatable.dart';

class NotificationTypeEntity extends Equatable{
  final int id;
  final String value;
  final String titleRu;

  const NotificationTypeEntity({
    required this.id,
    required this.value,
    required this.titleRu,
    required this.titleKk,
    this.titleEn,
    this.createdAt,
    this.updatedAt
});

  final String titleKk;
  final String? titleEn;
  final String? createdAt;
  final String? updatedAt;


  @override
  List<Object?> get props => [
    id,value,titleRu,titleKk,titleEn,createdAt,updatedAt
  ];

}
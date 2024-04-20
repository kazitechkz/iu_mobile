import 'package:equatable/equatable.dart';

class AppealTypeEntity extends Equatable {
  final int id;
  final String titleRu;
  final String titleKk;
  final bool isActive;

  const AppealTypeEntity({required this.id, required this.titleKk, required this.titleRu, required this.isActive});

  @override
  List<Object?> get props => [id, titleKk, titleRu, isActive];
}
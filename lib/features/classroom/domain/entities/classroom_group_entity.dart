import 'package:equatable/equatable.dart';

class ClassroomGroupEntity extends Equatable{
  final int id;
  final int teacherId;
  final String titleRu;
  final String? titleKk;
  final String? promoCode;
  final int classroomsCount;

  const ClassroomGroupEntity({required this.id, required this.teacherId, required this.titleRu, required this.titleKk, required this.classroomsCount, required this.promoCode});

  @override
  List<Object?> get props => [id,teacherId,titleRu,titleKk,promoCode,classroomsCount];
}
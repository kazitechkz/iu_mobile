import 'package:equatable/equatable.dart';
import 'package:iu/features/classroom/domain/entities/classroom_group_entity.dart';

class ClassRoomEntity extends Equatable{
  final int id;
  final int studentId;
  final int classId;
  final int userCount;
  final ClassroomGroupEntity? classroomGroup;
  const ClassRoomEntity({required this.id, required this.studentId, required this.classId, required this.userCount,this.classroomGroup});
  @override
  List<Object?> get props => [id,studentId,classId,userCount];



}
import 'package:iu/features/classroom/data/models/classroom_group_model.dart';
import 'package:iu/features/classroom/domain/entities/classroom_entity.dart';

import '../../../../core/utils/typedef.dart';

class ClassRoomModel extends ClassRoomEntity{
  const ClassRoomModel({required super.id, required super.studentId, required super.classId, required super.userCount,super.classroomGroup});

  ClassRoomModel.fromMap(DataMap map)
      : this(
    id: map["id"],
    studentId: map["student_id"],
    classId: map["class_id"],
    userCount:map["user_count"],
    classroomGroup:map["classroom_group"] != null ? ClassroomGroupModel.fromMap(map["classroom_group"].cast<String, dynamic>()) : null
  );

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel.fromMap(json);
  }

  static List<ClassRoomModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => ClassRoomModel.fromMap(map)).toList();
  }
  
}
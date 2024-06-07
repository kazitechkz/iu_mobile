import '../../../../core/utils/typedef.dart';
import '../../domain/entities/classroom_group_entity.dart';

class ClassroomGroupModel extends ClassroomGroupEntity{
  const ClassroomGroupModel({required super.id, required super.teacherId, required super.titleRu, required super.titleKk, required super.classroomsCount, required super.promoCode});


  ClassroomGroupModel.fromMap(DataMap map)
      : this(
    id: map["id"],
    teacherId: map["teacher_id"],
    titleRu: map["title_ru"],
    titleKk:map["title_kk"],
    promoCode:map["promo_code"],
    classroomsCount:map["classrooms_count"] != null ? map["classrooms_count"] : 0,
  );

  factory ClassroomGroupModel.fromJson(Map<String, dynamic> json) {
    return ClassroomGroupModel.fromMap(json);
  }

  static List<ClassroomGroupModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => ClassroomGroupModel.fromMap(map)).toList();
  }
  
}
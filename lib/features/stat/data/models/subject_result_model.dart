import '../../../../core/utils/typedef.dart';
import '../../domain/entities/subject_result_entity.dart';

class SubjectResultModel extends SubjectResultEntity {
  const SubjectResultModel(
      {required super.subjectId,
      required super.right,
      required super.notRight,
      required super.total,
      required super.point});

  SubjectResultModel.fromMap(DataMap map)
      : this(
          subjectId: map["subject_id"],
          right: map["right"],
          notRight: map["not_right"],
          total: map["total"],
          point:map["point"].toString(),
        );

  factory SubjectResultModel.fromJson(Map<String, dynamic> json) {
    return SubjectResultModel.fromMap(json);
  }

  static List<SubjectResultModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubjectResultModel.fromMap(map)).toList();
  }
}

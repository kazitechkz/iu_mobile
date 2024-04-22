import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/stat/data/models/stat_by_subject_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/stat_by_subject_id_entity.dart';

class StatBySubjectIdModel extends StatBySubjectIdEntity {
  StatBySubjectIdModel(
      {required SubjectModel super.subject,
      required List<StatBySubjectModel> super.statBySubject});

  StatBySubjectIdModel.fromMap(DataMap map)
      : this(
          subject: SubjectModel.fromMap(map["subject"]),
          statBySubject: StatBySubjectModel.fromMapList(map["stat_by_subject"].cast<Map<String,dynamic>>()),
        );

  factory StatBySubjectIdModel.fromJson(Map<String, dynamic> json) {
    return StatBySubjectIdModel.fromMap(json);
  }

  static List<StatBySubjectIdModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => StatBySubjectIdModel.fromMap(map)).toList();
  }
}

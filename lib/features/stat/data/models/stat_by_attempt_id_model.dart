import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/data/models/attempt_model.dart';
import 'package:iu/features/stat/data/models/stat_by_attempt_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/stat_by_attempt_id_entity.dart';

class StatByAttemptIdModel extends StatByAttemptIdEntity {
  const StatByAttemptIdModel(
      {required AttemptModel super.attempt,
      required List<SubjectModel> super.subjects,
      required List<StatByAttemptModel> super.statByAttempt});

  StatByAttemptIdModel.fromMap(DataMap map)
      : this(
          attempt: AttemptModel.fromMap(map["attempt"]),
          subjects: SubjectModel.fromMapList(map["subjects"].cast<Map<String,dynamic>>()),
          statByAttempt: StatByAttemptModel.fromMapList(map["stat_by_attempt"].cast<Map<String,dynamic>>()),
        );

  factory StatByAttemptIdModel.fromJson(Map<String, dynamic> json) {
    return StatByAttemptIdModel.fromMap(json);
  }

  static List<StatByAttemptIdModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => StatByAttemptIdModel.fromMap(map)).toList();
  }
}

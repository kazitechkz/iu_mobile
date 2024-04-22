import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/data/models/attempt_model.dart';
import 'package:iu/features/stat/data/models/subject_result_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/result_by_attempt_id_entity.dart';

class ResultByAttemptIdModel extends ResultByAttemptIdEntity {
  const ResultByAttemptIdModel(
      {required AttemptModel super.attempt,
      List<SubjectModel>? super.subjects,
      List<SubjectResultModel>? super.subjectResult});

  ResultByAttemptIdModel.fromMap(DataMap map)
      : this(
          attempt: AttemptModel.fromMap(map["attempt"]),
          subjects: map["subjects"] != null
              ? SubjectModel.fromMapList(map["subjects"].cast<Map<String,dynamic>>())
              : null,
          subjectResult: map["subject_result"] != null
              ? SubjectResultModel.fromMapList(map["subject_result"].cast<Map<String,dynamic>>())
              : null,
        );

  factory ResultByAttemptIdModel.fromJson(Map<String, dynamic> json) {
    return ResultByAttemptIdModel.fromMap(json);
  }

  static List<ResultByAttemptIdModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => ResultByAttemptIdModel.fromMap(map)).toList();
  }
}

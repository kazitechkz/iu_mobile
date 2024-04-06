import 'package:equatable/equatable.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/data/models/attempt_common_model.dart';
import 'package:iu/features/attempt/data/models/attempt_model.dart';
import 'package:iu/features/attempt/data/models/attempt_question_model.dart';

import '../../domain/entities/get_stat_entity.dart';

class GetStatModel extends GetStatEntity {
  const GetStatModel(
      {required List<AttemptQuestionModel> super.attemptQuestions,
      required AttemptCommonModel super.attempt,
      required AttemptModel super.result});

  GetStatModel.fromMap(DataMap map)
      : this(
          attemptQuestions: AttemptQuestionModel.fromMapList(
              map["attempt_questions"].cast<Map<String, dynamic>>()),
          attempt: AttemptCommonModel.fromMap(map["attempt"]),
          result: AttemptModel.fromMap(map["result"]),
        );

  factory GetStatModel.fromJson(Map<String, dynamic> json) {
    return GetStatModel.fromMap(json);
  }

  static List<GetStatModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetStatModel.fromMap(map)).toList();
  }
}

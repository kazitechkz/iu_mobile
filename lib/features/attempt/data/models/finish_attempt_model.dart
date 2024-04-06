import 'package:iu/features/attempt/domain/entities/finish_attempt_entity.dart';

import '../../../../core/utils/typedef.dart';

class FinishAttemptModel extends FinishAttemptEntity {
  const FinishAttemptModel({required super.attemptId, required super.points});

  FinishAttemptModel.fromMap(DataMap map)
      : this(
          attemptId: map["attempt_id"],
          points: map["points"],
        );

  factory FinishAttemptModel.fromJson(Map<String, dynamic> json) {
    return FinishAttemptModel.fromMap(json);
  }

  static List<FinishAttemptModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => FinishAttemptModel.fromMap(map)).toList();
  }
}

import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/unt_stat_entity.dart';

class UntStatModel extends UntStatEntity {
  const UntStatModel({
    required super.attemptCount,
    required super.attemptCountUnfinished,
    required super.attemptQuestionCount,
    required super.average,
    required StatByWeekModel super.statByWeek,
  });
  UntStatModel.fromMap(DataMap map)
      : this(
          attemptCount: map["attempt_count"],
          attemptCountUnfinished: map["attempt_count_unfinished"],
          attemptQuestionCount: map["attempt_question_count"],
          average: map["average"],
          statByWeek: StatByWeekModel.fromMap(map["stat_by_week"]),
        );
  factory UntStatModel.fromJson(Map<String, dynamic> json) {
    return UntStatModel.fromMap(json);
  }

  static List<UntStatModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => UntStatModel.fromMap(map)).toList();
  }
}

class StatByWeekModel extends StatByWeekEntity {
  const StatByWeekModel(super.data);

  factory StatByWeekModel.fromMap(DataMap map) {
    Map<String, String> mapString = map.map((key, value) {
      return MapEntry(key, value?.toString() ?? '');
    });
    return StatByWeekModel(mapString);
  }
}

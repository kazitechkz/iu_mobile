import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/subject.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/propose_subject_for_battle_entity.dart';

class ProposeSubjectForBattleModel extends ProposeSubjectForBattleEntity {
  const ProposeSubjectForBattleModel({super.chosenSubject, super.subjects});

  ProposeSubjectForBattleModel.fromMap(DataMap map)
      : this(
          chosenSubject: map["chosen_subject"],
          subjects: map["subjects"] != null
              ? SubjectModel.fromMapList(
                  map["subjects"].cast<Map<String, dynamic>>())
              : null,
        );

  factory ProposeSubjectForBattleModel.fromJson(Map<String, dynamic> json) {
    return ProposeSubjectForBattleModel.fromMap(json);
  }

  static List<ProposeSubjectForBattleModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => ProposeSubjectForBattleModel.fromMap(map))
        .toList();
  }
}

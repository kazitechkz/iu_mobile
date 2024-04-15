import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/battle/data/models/battle_step_model.dart';
import 'package:iu/features/battle/domain/entities/battle_step_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/battle_step_result_entity.dart';

class BattleStepResultModel extends BattleStepResultEntity {
  const BattleStepResultModel(
      {required super.id,
      required super.stepId,
      super.answeredUser,
      required super.startAt,
      super.endAt,
      required super.mustFinishedAt,
      required super.isFinished,
      required super.result,
      super.createdAt,
      super.updatedAt,
      BattleStepModel? super.battleStep,
      OrdinaryUserModel? super.answered});

  BattleStepResultModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          stepId: map["step_id"],
          answeredUser: map["answered_user"],
          startAt: map["start_at"],
          endAt: map["end_at"],
          mustFinishedAt: map["must_finished_at"],
          isFinished: map["is_finished"],
          result: map["result"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          battleStep: map["battle_step"] != null
              ? BattleStepModel.fromMap(map["battle_step"])
              : null,
          answered: map["answered"] != null
              ? OrdinaryUserModel.fromMap(map["answered"])
              : null,
        );

  factory BattleStepResultModel.fromJson(Map<String, dynamic> json) {
    return BattleStepResultModel.fromMap(json);
  }

  static List<BattleStepResultModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => BattleStepResultModel.fromMap(map)).toList();
  }
}

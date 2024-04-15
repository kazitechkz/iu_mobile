import 'package:equatable/equatable.dart';
import 'package:iu/features/battle/domain/entities/finish_battle_result_entity.dart';

import '../../../../core/utils/typedef.dart';

class FinishBattleResultModel extends FinishBattleResultEntity{

  const FinishBattleResultModel({required super.battlePromoCode, super.nextBattleStepId});

  FinishBattleResultModel.fromMap(DataMap map)
      : this(
    battlePromoCode: map["battle_promo_code"],
    nextBattleStepId: map["next_battle_step_id"],
  );

  factory FinishBattleResultModel.fromJson(Map<String, dynamic> json) {
    return FinishBattleResultModel.fromMap(json);
  }

  static List<FinishBattleResultModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => FinishBattleResultModel.fromMap(map)).toList();
  }



}
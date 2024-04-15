import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/battle/data/models/battle_step_question_model.dart';
import 'package:iu/features/battle/data/models/battle_step_result_model.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_result_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/battle_step_entity.dart';

class BattleStepModel extends BattleStepEntity {

  const BattleStepModel({required super.id,
    required super.promoCode,
    required super.battleId,
    super.subjectId,
    super.current_user,
    required super.isFinished,
    required super.isCurrent,
    required super.isLast,
    super.createdAt,
    super.updatedAt,
    OrdinaryUserModel? super.currentUser,
    List<BattleStepQuestionModel>? super.battleStepQuestions,
    //this one
    List<BattleStepResultModel>? super.battleStepResults,
  });

  BattleStepModel.fromMap(DataMap map)
      : this(
    id: map["id"],
    promoCode: map["promo_code"],
    battleId: map["battle_id"],
    subjectId: map["subject_id"],
    current_user: map["current_user"],
    isFinished: map["is_finished"],
    isCurrent: map["is_current"],
    isLast: map["is_last"],
    createdAt: map["created_at"],
    updatedAt: map["updated_at"],
    currentUser: map["currentUser"] != null ? OrdinaryUserModel.fromJson(
        map["currentUser"]) : null,
    battleStepQuestions: map["battle_step_questions"] != null
        ? BattleStepQuestionModel.fromMapList(
        map["battle_step_questions"].cast<Map<String, dynamic>>()) : null,
    battleStepResults: map["battle_step_results"] != null
        ? BattleStepResultModel.fromMapList(
        map["battle_step_results"].cast<Map<String, dynamic>>()) : null,
  );

  factory BattleStepModel.fromJson(Map<String, dynamic> json) {
    return BattleStepModel.fromMap(json);
  }

  static List<BattleStepModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => BattleStepModel.fromMap(map)).toList();
  }

}

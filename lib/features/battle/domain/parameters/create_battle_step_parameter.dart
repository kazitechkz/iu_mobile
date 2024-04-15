import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';

class CreateBattleStepParameter{
  final int battle_step_id;
  final int? subject_id;
  const CreateBattleStepParameter({required int this.battle_step_id, this.subject_id});

  DataMap toMap() {
    return {
      "battle_step_id": battle_step_id.toString(),
      "subject_id": subject_id != null ? subject_id.toString() : null,
    };
  }
}
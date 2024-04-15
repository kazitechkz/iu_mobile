import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/battle/domain/entities/battle_step_entity.dart';

class BattleStepResultEntity extends Equatable {
  final int id;
  final int stepId;
  final int? answeredUser;
  final String startAt;
  final String? endAt;
  final String mustFinishedAt;
  final bool isFinished;
  final int result;
  final String? createdAt;
  final String? updatedAt;
  final BattleStepEntity? battleStep;
  final OrdinaryUserEntity? answered;

  const BattleStepResultEntity(
      {required this.id,
      required this.stepId,
      this.answeredUser,
      required this.startAt,
      this.endAt,
      required this.mustFinishedAt,
      required this.isFinished,
      required this.result,
      this.createdAt,
      this.updatedAt,
      this.battleStep,
      this.answered});



  @override
  List<Object?> get props => [
        id,
        stepId,
        answeredUser,
        startAt,
        endAt,
        mustFinishedAt,
        isFinished,
        result
      ];
}

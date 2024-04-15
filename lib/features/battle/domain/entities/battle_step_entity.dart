import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/battle/domain/entities/battle_step_question_entity.dart';
import 'package:iu/features/battle/domain/entities/battle_step_result_entity.dart';

class BattleStepEntity extends Equatable {
  final int id;

  const BattleStepEntity(
      {required this.id,
      required this.promoCode,
      required this.battleId,
      this.subjectId,
      this.current_user,
      required this.isFinished,
      required this.isCurrent,
      required this.isLast,
      this.createdAt,
      this.updatedAt,
      this.currentUser,
      this.battleStepQuestions,
      this.battleStepResults,
      });

  final String promoCode;
  final int battleId;
  final int? subjectId;
  final int? current_user;
  final bool isFinished;
  final bool isCurrent;
  final bool isLast;
  final String? createdAt;
  final String? updatedAt;
  final OrdinaryUserEntity? currentUser;
  final List<BattleStepQuestionEntity>? battleStepQuestions;
  final List<BattleStepResultEntity>? battleStepResults;

  @override
  List<Object?> get props => [
        id,
        promoCode,
        battleId,
        subjectId,
        current_user,
        isFinished,
        isCurrent,
        isLast
      ];
}

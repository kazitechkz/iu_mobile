import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';

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
      this.currentUser});

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

  // battle_step_questions:BattleStepQuestion[]|null
  // battle_step_results:BattleStepResult[]|null

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

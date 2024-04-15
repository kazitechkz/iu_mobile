import 'package:equatable/equatable.dart';

class FinishBattleResultEntity extends Equatable{
  final String battlePromoCode;
  final int? nextBattleStepId;

  const FinishBattleResultEntity({required this.battlePromoCode, this.nextBattleStepId});

  @override
  List<Object?> get props => [battlePromoCode,nextBattleStepId];




}
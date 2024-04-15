import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/battle/domain/entities/battle_step_entity.dart';

class BattleEntity extends Equatable {
  final int id;
  final String promoCode;
  final String? passCode;
  final int price;
  final int ownerId;
  final int? guestId;
  final int? winnerId;
  final int localeId;
  final int? ownerPoint;
  final int? guestPoint;
  final bool isOpen;
  final bool? isFinished;
  final int timeLeftSeconds;
  final String startAt;
  final String? endAt;
  final String? mustFinishedAt;
  final String? createdAt;
  final String? updatedAt;
  final LocaleEntity? locale;
  final OrdinaryUserEntity? owner;
  final OrdinaryUserEntity? guest;
  final OrdinaryUserEntity? winner;
  final List<BattleStepEntity>? battleSteps;

  const BattleEntity(
      {required this.id,
      required this.promoCode,
      this.passCode,
      required this.price,
      required this.ownerId,
      this.guestId,
      this.winnerId,
      required this.localeId,
      this.ownerPoint,
      this.guestPoint,
      required this.isOpen,
        this.isFinished,
      required this.timeLeftSeconds,
      required this.startAt,
      this.endAt,
      this.mustFinishedAt,
      this.createdAt,
      this.updatedAt,
      this.locale,
      this.owner,
      this.guest,
      this.winner,
      this.battleSteps});

  @override
  List<Object?> get props => [
        id,
        promoCode,
        passCode,
        price,
        ownerId,
        guestId,
        winnerId,
        localeId,
        ownerPoint,
        guestPoint,
        isOpen,
        isFinished,
        timeLeftSeconds,
        startAt,
        endAt,
        mustFinishedAt,
        createdAt,
        updatedAt
      ];
}

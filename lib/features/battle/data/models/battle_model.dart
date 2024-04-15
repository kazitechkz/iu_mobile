import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/battle/data/models/battle_step_model.dart';
import 'package:iu/features/battle/domain/entities/battle_entity.dart';

import '../../../../core/utils/typedef.dart';

class BattleModel extends BattleEntity {
  const BattleModel(
      {required super.id,
      required super.promoCode,
      super.passCode,
      required super.price,
      required super.ownerId,
      super.guestId,
      super.winnerId,
      required super.localeId,
      super.ownerPoint,
      super.guestPoint,
      required super.isOpen,
        super.isFinished,
      required super.timeLeftSeconds,
      required super.startAt,
      super.endAt,
      super.mustFinishedAt,
      super.createdAt,
      super.updatedAt,
      LocaleModel? super.locale,
      OrdinaryUserModel? super.owner,
      OrdinaryUserModel? super.guest,
      OrdinaryUserModel? super.winner,
      List<BattleStepModel>? super.battleSteps});

  BattleModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          promoCode: map["promo_code"],
          passCode: map["pass_code"],
          price: map["price"],
          ownerId: map["owner_id"],
          guestId: map["guest_id"],
          winnerId: map["winner_id"],
          localeId: map["locale_id"],
          ownerPoint: map["owner_point"],
          guestPoint: map["guest_point"],
          isOpen: map["is_open"],
          isFinished: map["is_finished"],
          timeLeftSeconds: map["time_left_seconds"],
          startAt: map["start_at"],
          endAt: map["end_at"],
          mustFinishedAt: map["must_finished_at"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          locale: map["locale"] != null ? LocaleModel.fromMap(map["locale"]) : null,
          owner: map["owner"] != null ? OrdinaryUserModel.fromMap(map["owner"]) : null,
          guest: map["guest"] != null ? OrdinaryUserModel.fromMap(map["guest"]) : null,
          winner: map["winner"] != null ? OrdinaryUserModel.fromMap(map["winner"]) : null,
          battleSteps: map["battle_steps"] != null ? BattleStepModel.fromMapList(map["battle_steps"].cast<Map<String, dynamic>>()) : null,
        );

  factory BattleModel.fromJson(Map<String, dynamic> json) {
    return BattleModel.fromMap(json);
  }

  static List<BattleModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => BattleModel.fromMap(map)).toList();
  }
}

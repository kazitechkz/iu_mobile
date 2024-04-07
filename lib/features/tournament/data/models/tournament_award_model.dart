import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/data/models/tournament_user_model.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tournament_award_entity.dart';

class TournamentAwardModel extends TournamentAwardEntity {
  const TournamentAwardModel(
      {required super.id,
      required super.titleRu,
      required super.titleKk,
      super.titleEn,
      required super.isAwarded,
      required super.tournamentId,
      required super.subTournamentId,
      required super.userId,
      required super.order,
      TournamentUserModel? super.user,
      super.deletedAt,
      super.createdAt,
      super.updatedAt});

  TournamentAwardModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          isAwarded: map["is_awarded"],
          tournamentId: map["tournament_id"],
          subTournamentId: map["sub_tournament_id"],
          userId: map["user_id"],
          order: map["order"],
          user: map["user"] != null
              ? TournamentUserModel.fromMap(map["user"])
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
        );

  factory TournamentAwardModel.fromJson(Map<String, dynamic> json) {
    return TournamentAwardModel.fromMap(json);
  }

  static List<TournamentAwardModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TournamentAwardModel.fromMap(map)).toList();
  }
}

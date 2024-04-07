import 'package:iu/features/tournament/domain/entities/tournament_step_entity.dart';

import '../../../../core/utils/typedef.dart';

class TournamentStepModel extends TournamentStepEntity {
  const TournamentStepModel({
    required super.id,
    required super.titleRu,
    required super.titleKk,
    super.titleEn,
    required super.maxParticipants,
    required super.isFirst,
    required super.isLast,
    super.prevId,
    super.nextId,
    required super.order,
    required super.isPlayoff,
    super.deletedAt,
    super.createdAt,
    super.updatedAt,
  });

  TournamentStepModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          maxParticipants: map["max_participants"],
          isFirst: map["is_first"],
          isLast: map["is_last"],
          prevId: map["prev_id"],
          nextId: map["next_id"],
          order: map["order"],
          isPlayoff: map["is_playoff"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
        );

  factory TournamentStepModel.fromJson(Map<String, dynamic> json) {
    return TournamentStepModel.fromMap(json);
  }

  static List<TournamentStepModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TournamentStepModel.fromMap(map)).toList();
  }
}

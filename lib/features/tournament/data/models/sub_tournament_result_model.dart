import 'package:iu/features/tournament/data/models/sub_tournament_model.dart';
import 'package:iu/features/tournament/data/models/tournament_user_model.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_result_entity.dart';

import '../../../../core/utils/typedef.dart';

class SubTournamentResultModel extends SubTournamentResultEntity {
  const SubTournamentResultModel({
    required super.id,
    required super.userId,
    required super.subTournamentId,
    super.pointNumber,
    super.time,
    required super.attemptId,
    SubTournamentModel? super.subTournament,
    TournamentUserModel? super.user,
    super.deletedAt,
    super.createdAt,
    super.updatedAt,
  });

  SubTournamentResultModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          userId: map["user_id"],
          subTournamentId: map["sub_tournament_id"],
          pointNumber: map["point_number"],
          time: map["time"],
          attemptId: map["attempt_id"],
          user: map["user"] != null
              ? TournamentUserModel.fromMap(map["user"])
              : null,
          subTournament: map["sub_tournament"] != null
              ? SubTournamentModel.fromMap(map["sub_tournament"])
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
        );

  factory SubTournamentResultModel.fromJson(Map<String, dynamic> json) {
    return SubTournamentResultModel.fromMap(json);
  }

  static List<SubTournamentResultModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubTournamentResultModel.fromMap(map)).toList();
  }
}

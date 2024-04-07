import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_model.dart';
import 'package:iu/features/tournament/data/models/tournament_user_model.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/sub_tournament_participant_entity.dart';

class SubTournamentParticipantModel extends SubTournamentParticipantEntity {
  const SubTournamentParticipantModel(
      {required super.id,
      required super.userId,
      required super.subTournamentId,
      required super.status,
      SubTournamentModel? super.subTournament,
      TournamentUserModel? super.user,
      super.deletedAt,
      super.createdAt,
      super.updatedAt});

  factory SubTournamentParticipantModel.fromJson(Map<String, dynamic> json) {
    return SubTournamentParticipantModel.fromMap(json);
  }

  static List<SubTournamentParticipantModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => SubTournamentParticipantModel.fromMap(map))
        .toList();
  }

  SubTournamentParticipantModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          userId: map["user_id"],
          subTournamentId: map["sub_tournament_id"],
          status: map["status"],
          subTournament: map["sub_tournament"] != null
              ? SubTournamentModel.fromMap(map["sub_tournament"])
              : null,
          user: map["user"] != null
              ? TournamentUserModel.fromMap(map["user"])
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
        );
}

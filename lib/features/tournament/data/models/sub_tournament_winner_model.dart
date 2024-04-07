import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_model.dart';
import 'package:iu/features/tournament/data/models/tournament_user_model.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/sub_tournament_winner_entity.dart';

class SubTournamentWinnerModel extends SubTournamentWinnerEntity {
  SubTournamentWinnerModel(
      {required super.id,
      required super.userId,
      required super.subTournamentId,
      TournamentUserModel? super.user,
      SubTournamentModel? super.subTournament});

  factory SubTournamentWinnerModel.fromJson(Map<String, dynamic> json) {
    return SubTournamentWinnerModel.fromMap(json);
  }

  static List<SubTournamentWinnerModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubTournamentWinnerModel.fromMap(map)).toList();
  }

  SubTournamentWinnerModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          userId: map["user_id"],
          subTournamentId: map["sub_tournament_id"],
          user: map["user"] != null
              ? TournamentUserModel.fromMap(map["user"])
              : null,
          subTournament: map["sub_tournament"] != null
              ? SubTournamentModel.fromMap(map["sub_tournament"])
              : null,
        );
}

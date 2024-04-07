import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_model.dart';
import 'package:iu/features/tournament/data/models/tournament_user_model.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/sub_tournament_rival_entity.dart';

class SubTournamentRivalModel extends SubTournamentRivalEntity {
  const SubTournamentRivalModel(
      {required super.id,
      required super.rivalOne,
      required super.pointOne,
      required super.timeOne,
      required super.rivalTwo,
      required super.pointTwo,
      required super.timeTwo,
      super.winner,
      required super.subTournamentId,
      TournamentUserModel? super.winnerUser,
      TournamentUserModel? super.rivalOneUser,
      TournamentUserModel? super.rivalTwoUser,
      SubTournamentModel? super.subTournament});

  factory SubTournamentRivalModel.fromJson(Map<String, dynamic> json) {
    return SubTournamentRivalModel.fromMap(json);
  }

  static List<SubTournamentRivalModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubTournamentRivalModel.fromMap(map)).toList();
  }

  SubTournamentRivalModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          rivalOne: map["rival_one"],
          pointOne: map["point_one"],
          timeOne: map["time_one"],
          rivalTwo: map["rival_two"],
          pointTwo: map["point_two"],
          timeTwo: map["time_two"],
          winner: map["winner"],
          subTournamentId: map["sub_tournament_id"],
          winnerUser: map["winner_user"] != null
              ? TournamentUserModel.fromMap(map["winner_user"])
              : null,
          rivalOneUser: map["rival_one_user"] != null
              ? TournamentUserModel.fromMap(map["rival_one_user"])
              : null,
          rivalTwoUser: map["rival_two_user"] != null
              ? TournamentUserModel.fromMap(map["rival_two_user"])
              : null,
          subTournament: map["sub_tournament"] != null
              ? SubTournamentModel.fromMap(map["sub_tournament"])
              : null,
        );
}

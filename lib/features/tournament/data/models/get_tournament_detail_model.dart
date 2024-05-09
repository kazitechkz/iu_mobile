import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_model.dart';
import 'package:iu/features/tournament/data/models/tournament_model.dart';
import 'package:iu/features/tournament/data/models/tournament_step_model.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_step_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_tournament_detail_entity.dart';

class GetTournamentDetailModel extends GetTournamentDetailEntity {
  const GetTournamentDetailModel(
      {required TournamentModel super.tournament,
      required List<TournamentStepModel> super.steps,
      required super.isJoin,
      SubTournamentModel? super.firstSubTournament,
      SubTournamentModel? super.currentSubTournament,
      required super.checkAccess,
      required super.isReg,
      OrdinaryUserModel? super.winnerTournament});

  factory GetTournamentDetailModel.fromJson(Map<String, dynamic> json) {
    return GetTournamentDetailModel.fromMap(json);
  }

  static List<GetTournamentDetailModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetTournamentDetailModel.fromMap(map)).toList();
  }

  GetTournamentDetailModel.fromMap(DataMap map)
      : this(
          tournament: TournamentModel.fromMap(map["tournament"]),
          steps: TournamentStepModel.fromMapList(
              map["steps"].cast<Map<String, dynamic>>()),
          isJoin: map["is_join"],
          firstSubTournament: map["firstSubTournament"] != null
              ? SubTournamentModel.fromMap(map["firstSubTournament"])
              : null,
          currentSubTournament: map["currentSubTournament"] != null
              ? SubTournamentModel.fromMap(map["currentSubTournament"])
              : null,
          checkAccess: map["check_access"],
          isReg: map["is_reg"],
          winnerTournament: map["winner_tournament"] != null
              ? OrdinaryUserModel.fromMap(map["winner_tournament"])
              : null,
        );
}

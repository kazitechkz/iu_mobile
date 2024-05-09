import 'package:iu/features/tournament/data/models/tournament_model.dart';
import 'package:iu/features/tournament/domain/entities/get_all_tournaments_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';

import '../../../../core/utils/typedef.dart';

class GetAllTournamentModel extends GetAllTournamentEntity {
  const GetAllTournamentModel(
      {required List<TournamentModel> super.open,
      required List<TournamentModel> super.participated,
      required super.tournamentIds});

  GetAllTournamentModel.fromMap(DataMap map)
      : this(
            open: TournamentModel.fromMapList(
                map["open"].cast<Map<String, dynamic>>()),
            participated: TournamentModel.fromMapList(
                map["participated"].cast<Map<String, dynamic>>()),
            tournamentIds: {}); //map["tournament_ids"];

  factory GetAllTournamentModel.fromJson(Map<String, dynamic> json) {
    return GetAllTournamentModel.fromMap(json);
  }

  static List<GetAllTournamentModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetAllTournamentModel.fromMap(map)).toList();
  }
}

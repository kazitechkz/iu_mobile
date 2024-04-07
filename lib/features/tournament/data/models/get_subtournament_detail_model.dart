import 'package:equatable/equatable.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_model.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_result_model.dart';
import 'package:iu/features/tournament/data/models/tournament_model.dart';
import 'package:iu/features/tournament/domain/entities/get_subtournament_detail_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_result_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';

import '../../../../core/utils/typedef.dart';

class GetSubTournamentDetailModel extends GetSubTournamentDetailEntity {
  const GetSubTournamentDetailModel(
      {required TournamentModel super.tournament,
      required super.subTournamentIds,
      required SubTournamentModel super.subTournament,
      SubTournamentResultModel? super.myResult});

  GetSubTournamentDetailModel.fromMap(DataMap map)
      : this(
          tournament: TournamentModel.fromMap(map["tournament"]),
          subTournamentIds: map["sub_tournament_ids"].cast<int>(),
          subTournament: SubTournamentModel.fromMap(map["sub_tournament"]),
          myResult: map["my_result"] != null
              ? SubTournamentResultModel.fromMap(map["my_result"])
              : null,
        );
  factory GetSubTournamentDetailModel.fromJson(Map<String, dynamic> json) {
    return GetSubTournamentDetailModel.fromMap(json);
  }

  static List<GetSubTournamentDetailModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetSubTournamentDetailModel.fromMap(map))
        .toList();
  }
}

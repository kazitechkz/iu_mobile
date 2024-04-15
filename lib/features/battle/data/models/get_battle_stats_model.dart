import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_battle_stats_entity.dart';

class GetBattleStatsModel extends GetBattleStatsEntity {

  const GetBattleStatsModel(
      {required super.total,
      required super.victory,
      required super.draft,
      required super.defeat});

  GetBattleStatsModel.fromMap(DataMap map)
      : this(
    total: map["total"],
    victory: map["victory"],
    draft: map["draft"],
    defeat: map["defeat"],
  );

  factory GetBattleStatsModel.fromJson(Map<String, dynamic> json) {
    return GetBattleStatsModel.fromMap(json);
  }

  static List<GetBattleStatsModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetBattleStatsModel.fromMap(map)).toList();
  }


}

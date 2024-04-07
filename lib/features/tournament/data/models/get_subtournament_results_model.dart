import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_result_model.dart';
import 'package:iu/features/tournament/domain/entities/get_subtournament_results_entity.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_result_entity.dart';

import '../../../../core/utils/typedef.dart';

class GetSubTournamentResultsModel extends GetSubTournamentResultsEntity {
  const GetSubTournamentResultsModel(
      {required PaginationData<List<SubTournamentResultModel>> super.results,
      required SubTournamentResultModel? super.myResult});

  factory GetSubTournamentResultsModel.fromJson(Map<String, dynamic> json) {
    return GetSubTournamentResultsModel.fromMap(json);
  }

  GetSubTournamentResultsModel.fromMap(DataMap map)
      : this(
            results: _handleMap(map),
            myResult: map["my_result"] != null
                ? SubTournamentResultModel.fromMap(map["my_result"])
                : null);

  static PaginationData<List<SubTournamentResultModel>> _handleMap(
      DataMap map) {
    PaginationData paginationData = PaginationData.fromMap(map["results"]);
    PaginationData<List<SubTournamentResultModel>> result =
        PaginationData.fromType(
            paginationData,
            SubTournamentResultModel.fromMapList(
                paginationData.data.cast<Map<String, dynamic>>()));
    return result;
  }

  static List<GetSubTournamentResultsModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetSubTournamentResultsModel.fromMap(map))
        .toList();
  }
}

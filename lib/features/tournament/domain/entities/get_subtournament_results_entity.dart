import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_result_entity.dart';

class GetSubTournamentResultsEntity extends Equatable {
  final PaginationData<List<SubTournamentResultEntity>> results;
  final SubTournamentResultEntity? myResult;

  const GetSubTournamentResultsEntity(
      {required this.results, required this.myResult});

  @override
  List<Object?> get props => [results, myResult];
}

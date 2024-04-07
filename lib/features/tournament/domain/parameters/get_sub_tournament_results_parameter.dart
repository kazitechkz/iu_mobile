import 'package:iu/core/utils/typedef.dart';

class GetSubTournamentResultsParameter {
  final int? page;
  final int id;
  const GetSubTournamentResultsParameter({this.page, required this.id});

  DataMap toMap() {
    return {"page": page ?? 1, "id": id};
  }
}

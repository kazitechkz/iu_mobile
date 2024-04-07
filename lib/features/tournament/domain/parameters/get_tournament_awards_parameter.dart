import 'package:iu/core/utils/typedef.dart';

class GetTournamentAwardsParameter {
  final int? page;
  final int id;

  const GetTournamentAwardsParameter({this.page, required this.id});

  DataMap toMap() {
    return {"id": id.toString(), "page": page ?? 1};
  }
}

import 'package:iu/core/utils/typedef.dart';

class GetSubTournamentParticipantsParameter {
  final int? page;
  final int id;
  const GetSubTournamentParticipantsParameter({this.page, required this.id});

  DataMap toMap() {
    return {"page": page ?? 1, "id": id};
  }
}

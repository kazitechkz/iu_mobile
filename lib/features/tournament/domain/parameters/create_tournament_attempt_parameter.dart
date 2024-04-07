import 'package:iu/core/utils/typedef.dart';

class CreateTournamentAttemptParameter {
  final int locale_id;
  final int sub_tournament_id;

  const CreateTournamentAttemptParameter(
      {required this.locale_id, required this.sub_tournament_id});

  DataMap toMap() {
    return {
      "locale_id": locale_id.toString(),
      "sub_tournament_id": sub_tournament_id.toString()
    };
  }
}

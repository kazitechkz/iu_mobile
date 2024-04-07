import '../../../../core/utils/typedef.dart';

class GetListOfTournamentParameter {
  final int page;
  const GetListOfTournamentParameter(this.page);

  DataMap toMap() {
    return {"page": page.toString()};
  }
}

import '../../../../core/utils/typedef.dart';

class GetBattleHistoryParameter{
  final int page;
  const GetBattleHistoryParameter({required this.page});

  DataMap toMap() {
    return {
      "page": page.toString(),
    };
  }

}
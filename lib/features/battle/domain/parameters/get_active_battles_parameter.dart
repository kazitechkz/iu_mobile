import '../../../../core/utils/typedef.dart';

class GetActiveBattlesParameter{
  final int page;
  const GetActiveBattlesParameter({required this.page});

  DataMap toMap() {
    return {
      "page": page.toString(),
    };
  }

}
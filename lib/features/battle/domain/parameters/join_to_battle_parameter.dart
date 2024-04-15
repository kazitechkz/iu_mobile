import '../../../../core/utils/typedef.dart';

class JoinToBattleParameter {
  final String promo_code;
  final String? pass_code;

  const JoinToBattleParameter({required this.promo_code, this.pass_code});

  DataMap toMap() {
    return {
      "promo_code": promo_code.toString(),
      "pass_code": pass_code,
    };
  }
}

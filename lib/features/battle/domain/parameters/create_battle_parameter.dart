import '../../../../core/utils/typedef.dart';

class CreateBattleParameter{
  final int locale_id;
  final int price;
  final String? pass_code;

  const CreateBattleParameter({required this.locale_id, required this.price, this.pass_code});
  DataMap toMap() {
    return {
      "locale_id": locale_id.toString(),
      "price": price.toString(),
      "pass_code": pass_code,
    };
  }
}
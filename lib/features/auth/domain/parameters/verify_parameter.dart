import 'package:iu/core/utils/typedef.dart';

class VerifyParameter{
  const VerifyParameter({
    required this.user_id,
    required this.code,
  });
  final String user_id;
  final String code;

  DataMap toMap(){
    return {
      "user_id":user_id,
      "code":code,
    };
  }
}
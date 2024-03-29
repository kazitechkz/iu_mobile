import 'package:iu/core/utils/typedef.dart';

class ForgetParameter{
  const ForgetParameter({
    required this.email,
    required this.code,
    required this.password,
});
  final String email;
  final String code;
  final String password;

  DataMap toMap(){
    return {
      "email":email,
      "code":code,
      "password":password
    };
  }
}
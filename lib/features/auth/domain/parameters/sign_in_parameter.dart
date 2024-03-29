import '../../../../core/utils/typedef.dart';

class SignInParameter{
  SignInParameter({required this.email, required this.password});
  final String email;
  final String password;

  DataMap toMap(){
    return {
      "email":email,
      "password":password
    };
  }
}
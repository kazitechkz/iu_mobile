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

class GoogleSignInParameter {
  final String name;
  final String email;
  GoogleSignInParameter({required this.name, required this.email});

  DataMap toMap() {
    return {
      "name": name,
      "email": email
    };
  }
}

class KundelikSignInParameter {
  final String token;
  KundelikSignInParameter({required this.token});

  DataMap toMap() {
    return {
      "token": token
    };
  }
}
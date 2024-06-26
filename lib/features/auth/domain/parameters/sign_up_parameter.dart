import '../../../../core/utils/typedef.dart';

class SignUpParameter {
  SignUpParameter(
      {required this.name,
      required this.email,
      required this.username,
      required this.phone,
      required this.password,
      required this.role});

  final String name;
  final String email;
  final String username;
  final String phone;
  final String password;
  final String role;

  DataMap toMap() {
    return {
      "name": name,
      "email": email,
      "username": username,
      "phone": phone,
      "password": password,
      "role": role
    };
  }
}

import '../../../../core/utils/typedef.dart';

class ChangeProfileParameter {
  final String name;
  final String password;
  final int? gender;
  final String birthDate;
  final String phone;

  ChangeProfileParameter(
      {required this.name,
      required this.password,
      this.gender,
      required this.birthDate,
      required this.phone});

  DataMap toMap() {
    return {
      "name": name.toString(),
      "password": password.toString(),
      "gender": gender,
      "date": birthDate.toString(),
      "phone": phone.toString(),
    };
  }
}

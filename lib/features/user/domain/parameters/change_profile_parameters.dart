import '../../../../core/utils/typedef.dart';

class ChangeProfileParameter{
  final String name;
  final String password;
  final int? gender;
  final String birth_date;
  final String phone;

  ChangeProfileParameter({required this.name,required this.password,this.gender,required this.birth_date,required this.phone});

  DataMap toMap(){
    return {
      "name":name.toString(),
      "password":password.toString(),
      "gender":gender,
      "birth_date":birth_date.toString(),
      "phone":phone.toString(),
    };
  }

}
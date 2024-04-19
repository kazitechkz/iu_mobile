import '../../../../core/utils/typedef.dart';

class FindUserByEmailParameter {
  final String email;
  FindUserByEmailParameter({required this.email});
  DataMap toMap(){
    return {
      "email":email.toString()
    };
  }
}

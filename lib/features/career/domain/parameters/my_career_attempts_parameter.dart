import '../../../../core/utils/typedef.dart';

class MyCareerAttemptsParameter{
  final int page;
  const MyCareerAttemptsParameter({required this.page});
  DataMap toMap(){
    return {
      "page":page.toString()
    };
  }
}
import 'package:iu/core/utils/typedef.dart';

class GetCareerQuizzesParameter{
  final int page;
  const GetCareerQuizzesParameter({
    required this.page
});
  DataMap toMap(){
    return {
      "page":page.toString()
    };
  }
}
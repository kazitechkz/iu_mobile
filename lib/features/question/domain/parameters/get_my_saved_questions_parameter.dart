import '../../../../core/utils/typedef.dart';

class GetMySavedQuestionsParameter{
  final int page;
  const GetMySavedQuestionsParameter({required this.page});
  DataMap toMap(){
    return {
      "page":page.toString()
    };
  }
}
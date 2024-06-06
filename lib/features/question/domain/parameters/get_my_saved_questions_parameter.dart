import '../../../../core/utils/typedef.dart';

class GetMySavedQuestionsParameter{
  final int page;
  const GetMySavedQuestionsParameter({required this.page});

  GetMySavedQuestionsParameter copyWith({int? page}) {
    return GetMySavedQuestionsParameter(
      page: page ?? this.page,
    );
  }

  DataMap toMap(){
    return {
      "page":page.toString()
    };
  }
}
import '../../../../core/utils/typedef.dart';

class GetMySavedQuestionByIdParameter {
  final int id;
  GetMySavedQuestionByIdParameter(this.id);
  DataMap toMap(){
    return {
      "id":id.toString()
    };
  }
}
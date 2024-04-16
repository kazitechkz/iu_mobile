import 'package:iu/core/utils/typedef.dart';

class FinishCareerQuizParameter {
  final int quiz_id;
  final String given_answers;

  const FinishCareerQuizParameter({
    required this.quiz_id,
    required this.given_answers,
  });

  DataMap toMap(){
    return {
      "quiz_id":quiz_id.toString(),
      "given_answers":given_answers.toString()
    };
  }
}

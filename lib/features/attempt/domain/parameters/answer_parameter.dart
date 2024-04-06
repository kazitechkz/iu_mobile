import 'package:iu/core/utils/typedef.dart';

class AnswerParameter {
  const AnswerParameter(
      {required this.attempt_id,
      required this.attempt_subject_id,
      required this.question_id,
      required this.answers,
      required this.attempt_type_id});

  final int attempt_id;
  final int attempt_subject_id;
  final int question_id;
  final String answers;
  final int attempt_type_id;

  DataMap toMap() {
    return {
      "attempt_id": attempt_id,
      "attempt_subject_id": attempt_subject_id,
      "question_id": question_id,
      "answers": answers,
      "attempt_type_id": attempt_type_id,
    };
  }
}

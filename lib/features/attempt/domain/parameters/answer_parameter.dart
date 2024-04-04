class AnswerParameter{
  final int attempt_id;
  final int attempt_subject_id;

  AnswerParameter({required this.attempt_id,required this.attempt_subject_id,required this.question_id, required this.answers,required this.attempt_type_id});

  final int question_id;
  final String answers;
  final int attempt_type_id;
}

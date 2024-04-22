import 'package:iu/core/utils/typedef.dart';

class OpenAiParams {
  final int questionId;
  final String? status;

  const OpenAiParams({required this.questionId, this.status});

  DataMap toMap() {
    return {
      'question_id': questionId,
      'status': status
    };
  }
}
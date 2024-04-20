import 'package:iu/core/utils/typedef.dart';

class CreateAppealParams {
  final String message;
  final int questionId;
  final int typeId;

  const CreateAppealParams({required this.message, required this.questionId, required this.typeId});

  DataMap toJson() {
    return {
      'message': message.toString(),
      'question_id': questionId,
      'type_id': typeId
    };
  }
}
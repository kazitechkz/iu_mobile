import 'package:iu/core/utils/typedef.dart';

class CreateForumParameter {
  final int subject_id;
  final String attachment;
  final String text;

  const CreateForumParameter({required this.subject_id, required this.attachment, required this.text});

  DataMap toMap(){
    return {
      "subject_id":subject_id.toString(),
      "attachment":attachment.toString(),
      "text":text.toString(),
    };
  }
}

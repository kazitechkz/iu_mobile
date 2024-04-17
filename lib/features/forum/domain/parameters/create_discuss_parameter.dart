import 'package:iu/core/utils/typedef.dart';

class CreateDiscussParameter{
  final int forum_id;
  final String text;

  const CreateDiscussParameter({required this.forum_id,required this.text});
  DataMap toMap(){
    return {
      "forum_id":forum_id.toString(),
      "text":text.toString(),
    };
  }
}
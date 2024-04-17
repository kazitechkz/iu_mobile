import 'package:iu/core/utils/typedef.dart';

class GetForumDiscussParameter {
  final int forum_id;
  final String type;
  final int page;

  const GetForumDiscussParameter(
      {required this.forum_id, required this.type, required this.page});
  DataMap toMap(){
    return {
      "forum_id":forum_id.toString(),
      "type":type.toString(),
      "page":page.toString(),
    };
  }
}

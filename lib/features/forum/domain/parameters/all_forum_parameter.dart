import 'package:iu/core/utils/typedef.dart';

class AllForumParameter{
  final String type;
  final int page;
  final int subjectId;
  final String search;

  const AllForumParameter({required this.type,required this.page,required this.subjectId,required this.search});

  DataMap toMap(){
    return {
      "type":type,
      "page":page.toString(),
      "subject_id":subjectId.toString(),
      "search":search.toString(),
    };
  }
}
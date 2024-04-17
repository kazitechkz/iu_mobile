import 'package:iu/core/utils/typedef.dart';

class GetVideoAuthorDetailParameter {
  final int id;
  final int page;

  const GetVideoAuthorDetailParameter({required this.id, required this.page});

  DataMap toMap(){
    return {
      "id":id.toString(),
      "page":page.toString()
    };
  }
}

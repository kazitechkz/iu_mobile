import 'package:iu/core/utils/typedef.dart';

class GetNotificationAllParameter {
  final int page;
  final String? status;
  final String? notification_type;
  final String? search;
  final int? type_id;

  const GetNotificationAllParameter(
      {required this.page,
      this.status,
      this.notification_type,
      this.search,
      this.type_id});

  DataMap toMap(){
    DataMap map = {
      "page":page.toString()
    };
    if(status != null){
      map["status"] = status.toString();
    }
    if(notification_type != null){
      map["notification_type"] = notification_type.toString();
    }
    if(search != null){
      map["search"] = search.toString();
    }
    if(type_id != null){
      map["type_id"] = type_id.toString();
    }
    return map;
  }

}

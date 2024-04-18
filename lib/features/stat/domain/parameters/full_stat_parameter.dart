import 'package:iu/core/utils/typedef.dart';

class FullStatParameter{
  final int? type_id;
  final int? subject_id;
  final String? start_at;
  final String? end_at;

  FullStatParameter({this.type_id, this.subject_id, this.start_at, this.end_at});

  DataMap toMap(){
    DataMap map = {};
    if(this.type_id != null){
      map["type_id"] = type_id.toString();
    }
    if(this.subject_id != null){
      map["subject_id"] = subject_id.toString();
    }
    if(this.start_at != null){
      map["start_at"] = start_at.toString();
    }
    if(this.end_at != null){
      map["end_at"] = end_at.toString();
    }
    return map;
  }

}
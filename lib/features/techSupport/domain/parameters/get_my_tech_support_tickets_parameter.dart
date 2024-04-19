import '../../../../core/utils/typedef.dart';

class GetMyTechSupportTicketsParameter {
  final bool? is_closed;
  final bool? is_resolved;
  final bool? is_answered;
  final int? type_id;
  final int? category_id;
  final String? search;
  final int page;

  GetMyTechSupportTicketsParameter(
      {this.is_closed,
      this.is_resolved,
      this.is_answered,
      this.type_id,
      this.category_id,
      this.search,
      required this.page});

  DataMap toMap(){
    DataMap map = {
      "page":page.toString()
    };
    if(is_closed != null){
      map["is_closed"] = is_closed.toString();
    }
    if(is_resolved != null){
      map["is_resolved"] = is_resolved.toString();
    }
    if(is_answered != null){
      map["is_answered"] = is_answered.toString();
    }
    if(type_id != null){
      map["type_id"] = type_id.toString();
    }
    if(category_id != null){
      map["category_id"] = category_id.toString();
    }
    if(search != null){
      map["search"] = search.toString();
    }
    return map;
  }
}

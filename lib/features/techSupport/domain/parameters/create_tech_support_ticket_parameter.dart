import '../../../../core/utils/typedef.dart';

class CreateTechSupportTicketParameter {
  final int type_id;
  final int category_id;
  final String title;
  final String message;
  CreateTechSupportTicketParameter(
      {required this.type_id,
      required this.category_id,
      required this.title,
      required this.message});
  DataMap toMap(){
    return {
      "type_id":type_id.toString(),
      "category_id":category_id.toString(),
      "title":title.toString(),
      "message":message.toString(),
    };
  }
}

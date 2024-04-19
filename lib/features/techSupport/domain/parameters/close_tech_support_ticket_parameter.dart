import '../../../../core/utils/typedef.dart';

class CloseTechSupportTicketParameter {
  final int ticket_id;
  final int is_closed;
  final int is_resolved;

  CloseTechSupportTicketParameter(
      {required this.ticket_id,
      required this.is_closed,
      required this.is_resolved});

  DataMap toMap(){
    return {
      "ticket_id":ticket_id.toString(),
      "is_closed":is_closed.toString(),
      "is_resolved":is_resolved.toString(),
    };
  }
}

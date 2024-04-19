import '../../../../core/utils/typedef.dart';

class GetTechSupportTicketDetailParameter {
  final int ticket_id;
  final int page;

  GetTechSupportTicketDetailParameter({
    required this.ticket_id,
    required this.page,
  });

  DataMap toMap() {
    return {
      "ticket_id": ticket_id.toString(),
      "page": page.toString(),
    };
  }
}

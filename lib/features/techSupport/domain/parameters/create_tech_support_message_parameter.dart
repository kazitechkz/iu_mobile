import '../../../../core/utils/typedef.dart';

class CreateTechSupportMessageParameter {
  final int ticket_id;
  final String message;

  CreateTechSupportMessageParameter(
      {required this.ticket_id, required this.message});

  DataMap toMap() {
    return {
      "ticket_id": ticket_id.toString(),
      "message": message.toString(),
    };
  }
}

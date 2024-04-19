import 'package:equatable/equatable.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_message_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_ticket_entity.dart';

import '../../../../core/common/models/pagination_data.dart';

class GetTechSupportTicketDetailEntity extends Equatable {
  final TechSupportTicketEntity ticket;
  final PaginationData<List<TechSupportMessageEntity>> messages;

  const GetTechSupportTicketDetailEntity({
    required this.ticket,
    required this.messages,
  });

  @override
  List<Object?> get props => [ticket,messages];
}

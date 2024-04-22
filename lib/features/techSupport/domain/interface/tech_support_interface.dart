import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/get_tech_support_ticket_detail_entity.dart';
import '../entities/tech_support_category_entity.dart';
import '../entities/tech_support_message_entity.dart';
import '../entities/tech_support_ticket_entity.dart';
import '../entities/tech_support_type_entity.dart';
import '../parameters/close_tech_support_ticket_parameter.dart';
import '../parameters/create_tech_support_message_parameter.dart';
import '../parameters/create_tech_support_ticket_parameter.dart';
import '../parameters/get_my_tech_support_tickets_parameter.dart';
import '../parameters/get_tech_support_ticket_detail_parameter.dart';

abstract class TechSupportInterface{
  ResultFuture<TechSupportTicketEntity> closeTechSupportTicket(CloseTechSupportTicketParameter parameter);
  ResultFuture<TechSupportMessageEntity> createTechSupportMessage(CreateTechSupportMessageParameter parameter);
  ResultFuture<TechSupportTicketEntity> createTechSupportTicket(CreateTechSupportTicketParameter parameter);
  ResultFuture<PaginationData<List<TechSupportTicketEntity>>> getMyTechSupportTickets(GetMyTechSupportTicketsParameter parameter);
  ResultFuture<List<TechSupportCategoryEntity>> getTechSupportCategories();
  ResultFuture<GetTechSupportTicketDetailEntity> getTechSupportTicketDetail(GetTechSupportTicketDetailParameter parameter);
  ResultFuture<List<TechSupportTypeEntity>> getTechSupportTypes();
}
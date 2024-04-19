import 'package:iu/core/utils/typedef.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/tech_support_ticket_entity.dart';
import '../interface/tech_support_interface.dart';
import '../parameters/get_my_tech_support_tickets_parameter.dart';

class GetMyTechSupportTicketsCase extends UseCaseWithParams<
    PaginationData<List<TechSupportTicketEntity>>,
    GetMyTechSupportTicketsParameter> {
  final TechSupportInterface _techSupportInterface;

  const GetMyTechSupportTicketsCase(this._techSupportInterface);

  @override
  ResultFuture<PaginationData<List<TechSupportTicketEntity>>> call(
      GetMyTechSupportTicketsParameter params) {
    return this._techSupportInterface.getMyTechSupportTickets(params);
  }
}

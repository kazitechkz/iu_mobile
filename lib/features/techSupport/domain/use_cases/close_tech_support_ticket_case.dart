import 'package:iu/core/utils/typedef.dart';

import '../../../../core/usecases/use_case.dart';
import '../entities/tech_support_ticket_entity.dart';
import '../interface/tech_support_interface.dart';
import '../parameters/close_tech_support_ticket_parameter.dart';

class CloseTechSupportTicketCase extends UseCaseWithParams<TechSupportTicketEntity,CloseTechSupportTicketParameter>{
  final TechSupportInterface _techSupportInterface;
  const CloseTechSupportTicketCase(this._techSupportInterface);

  @override
  ResultFuture<TechSupportTicketEntity> call(CloseTechSupportTicketParameter params) {
    return this._techSupportInterface.closeTechSupportTicket(params);
  }

}
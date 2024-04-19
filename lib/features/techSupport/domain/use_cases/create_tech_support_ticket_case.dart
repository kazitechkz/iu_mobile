import 'package:iu/core/utils/typedef.dart';

import '../../../../core/usecases/use_case.dart';
import '../entities/tech_support_ticket_entity.dart';
import '../interface/tech_support_interface.dart';
import '../parameters/create_tech_support_ticket_parameter.dart';

class CreateTechSupportTicketCase extends UseCaseWithParams<TechSupportTicketEntity,CreateTechSupportTicketParameter>{
  final TechSupportInterface _techSupportInterface;
  const CreateTechSupportTicketCase(this._techSupportInterface);

  @override
  ResultFuture<TechSupportTicketEntity> call(CreateTechSupportTicketParameter params) {
    return this._techSupportInterface.createTechSupportTicket(params);
  }
}
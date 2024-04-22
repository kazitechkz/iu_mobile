import 'package:iu/core/utils/typedef.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/get_tech_support_ticket_detail_entity.dart';
import '../interface/tech_support_interface.dart';
import '../parameters/get_tech_support_ticket_detail_parameter.dart';

class GetTechSupportTicketDetailCase extends UseCaseWithParams<GetTechSupportTicketDetailEntity,GetTechSupportTicketDetailParameter>{
  final TechSupportInterface _techSupportInterface;
  const GetTechSupportTicketDetailCase(this._techSupportInterface);
  @override
  ResultFuture<GetTechSupportTicketDetailEntity> call(GetTechSupportTicketDetailParameter params) {
    return this._techSupportInterface.getTechSupportTicketDetail(params);
  }

}
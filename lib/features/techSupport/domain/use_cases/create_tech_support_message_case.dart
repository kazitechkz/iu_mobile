import 'package:iu/core/utils/typedef.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/tech_support_message_entity.dart';
import '../interface/tech_support_interface.dart';
import '../parameters/create_tech_support_message_parameter.dart';

class CreateTechSupportMessageCase extends UseCaseWithParams<TechSupportMessageEntity,CreateTechSupportMessageParameter>{
  final TechSupportInterface _techSupportInterface;
  const CreateTechSupportMessageCase(this._techSupportInterface);

  @override
  ResultFuture<TechSupportMessageEntity> call(CreateTechSupportMessageParameter params) {
    return this._techSupportInterface.createTechSupportMessage(params);
  }
}
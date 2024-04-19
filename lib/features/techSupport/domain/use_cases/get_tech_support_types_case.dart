import 'package:iu/core/utils/typedef.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/tech_support_type_entity.dart';
import '../interface/tech_support_interface.dart';

class GetTechSupportTypesCase extends UseCaseWithoutParams<List<TechSupportTypeEntity>>{
  final TechSupportInterface _techSupportInterface;
  const GetTechSupportTypesCase(this._techSupportInterface);
  @override
  ResultFuture<List<TechSupportTypeEntity>> call() {
    return this._techSupportInterface.getTechSupportTypes();
  }

}
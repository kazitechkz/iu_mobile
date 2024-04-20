import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/domain/entities/appeal_type_entity.dart';
import 'package:iu/features/appeal/domain/interfaces/appeal_interface.dart';

class AppealTypeUseCase extends UseCaseWithoutParams<List<AppealTypeEntity>> {
  final AppealInterface appealInterface;
  AppealTypeUseCase(this.appealInterface);
  @override
  ResultFuture<List<AppealTypeEntity>> call() async {
    return await appealInterface.getAppealTypes();
  }

}
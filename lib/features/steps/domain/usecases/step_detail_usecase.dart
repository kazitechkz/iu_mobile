import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import 'package:iu/features/steps/domain/interface/step_interface.dart';

class StepDetailUseCase extends UseCaseWithParams<List<StepEntity>, String> {
  final StepInterface _stepDetailInterface;
  const StepDetailUseCase(this._stepDetailInterface);

  @override
  ResultFuture<List<StepEntity>> call(String params) {
    return _stepDetailInterface.getStepDetail(params);
  }
}

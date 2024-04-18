import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';
import 'package:iu/features/sub_steps/domain/interface/sub_step_interface.dart';

class SubStepUseCase extends UseCaseWithParams<List<SubStepEntity>, String> {
  final SubStepInterface _subStepDetailInterface;
  const SubStepUseCase(this._subStepDetailInterface);

  @override
  ResultFuture<List<SubStepEntity>> call(String params) {
    return _subStepDetailInterface.getSubSteps(params);
  }
}

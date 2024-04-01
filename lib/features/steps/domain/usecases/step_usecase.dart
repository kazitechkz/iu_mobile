import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import 'package:iu/features/steps/domain/interface/step_interface.dart';

class StepUseCase extends UseCaseWithoutParams<List<StepEntity>> {
  final StepInterface interface;
  const StepUseCase(this.interface);
  @override
  ResultFuture<List<StepEntity>> call() {
    // TODO: implement call
    return interface.getAll();
  }

}
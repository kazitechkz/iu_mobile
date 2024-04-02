import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/steps/domain/interface/step_interface.dart';

import '../entities/step_entity.dart';

class StepUseCase extends UseCaseWithoutParams<List<MainStepEntity>> {
  final StepInterface interface;
  const StepUseCase(this.interface);
  @override
  ResultFuture<List<MainStepEntity>> call() {
    // TODO: implement call
    return interface.getAll();
  }

}
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_steps/domain/interface/sub_step_interface.dart';
import 'package:iu/features/sub_steps/domain/parameters/pass_sub_step_exam_params.dart';

class PassSubStepExamUseCase extends UseCaseWithParams<int, List<PassSubStepExamParams>> {
  final SubStepInterface _subStepDetailInterface;
  const PassSubStepExamUseCase(this._subStepDetailInterface);

  @override
  ResultFuture<int> call(List<PassSubStepExamParams> params) {
    return _subStepDetailInterface.passSubStepExam(params);
  }
}

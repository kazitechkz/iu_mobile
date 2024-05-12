import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../interface/sub_step_interface.dart';

class CheckExamResultUseCase extends UseCaseWithParams<bool, SubStepExamParameters> {
  final SubStepInterface _subStepDetailInterface;
  const CheckExamResultUseCase(this._subStepDetailInterface);

  @override
  ResultFuture<bool> call(SubStepExamParameters params) async {
    return await _subStepDetailInterface.checkExamResult(params);
  }
}
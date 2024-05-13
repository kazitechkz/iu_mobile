import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../entities/sub_step_exam_entity.dart';
import '../interface/sub_step_interface.dart';

class GetSubStepExamResults extends UseCaseWithParams<List<SubStepExamEntity>, SubStepExamParameters> {
  final SubStepInterface _subStepDetailInterface;
  const GetSubStepExamResults(this._subStepDetailInterface);
  @override
  ResultFuture<List<SubStepExamEntity>> call(SubStepExamParameters params) async {
    return _subStepDetailInterface.getSubStepExamResult(params);
  }

}
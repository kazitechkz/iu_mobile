import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';

import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../interface/sub_step_interface.dart';

class SubStepDetailUseCase extends UseCaseWithParams<SubStepEntity, String> {
  final SubStepInterface _subStepDetailInterface;
  const SubStepDetailUseCase(this._subStepDetailInterface);

  @override
  ResultFuture<SubStepEntity> call(String params) {
    return _subStepDetailInterface.getSubStepDetail(params);
  }
}
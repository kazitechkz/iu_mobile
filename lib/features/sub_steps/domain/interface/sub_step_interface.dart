import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';

import '../../../../core/utils/typedef.dart';

abstract class SubStepInterface {
  ResultFuture<List<SubStepEntity>> getSubSteps(String stepID);
  ResultFuture<SubStepEntity> getSubStepDetail(String subStepID);
}
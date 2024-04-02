import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/step_entity.dart';

abstract class StepInterface {
  ResultFuture<List<MainStepEntity>> getAll();
}

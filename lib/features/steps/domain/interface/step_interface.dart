import 'package:iu/core/utils/typedef.dart';
import '../entities/step_entity.dart';

abstract class StepInterface {
  ResultFuture<List<MainStepEntity>> getAll();
  ResultFuture<List<StepEntity>> getStepDetail(String id);
}

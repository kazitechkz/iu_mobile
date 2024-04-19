import 'package:iu/core/utils/typedef.dart';

import '../entities/fact_entity.dart';

abstract class FactInterface {
  ResultFuture<FactEntity> getFact(String subjectID);
}
import 'package:iu/core/utils/typedef.dart';

import '../../../../core/common/models/subject.dart';

abstract class UntInterface{
  ResultFuture<List<SubjectEntity>> getSubjects();
}
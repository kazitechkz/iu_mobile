import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';

abstract class SubjectInterface {
  ResultFuture<List<SubjectEntity>> getSubjects();
  ResultFuture<List<SubjectEntity>> getMySubjects();
}
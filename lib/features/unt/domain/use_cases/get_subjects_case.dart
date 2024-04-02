import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/unt/domain/interfaces/unt_interface.dart';

class GetSubjectsCase extends UseCaseWithoutParams<List<SubjectEntity>>{
  final UntInterface untInterface;
  const GetSubjectsCase(this.untInterface);

  @override
  ResultFuture<List<SubjectEntity>> call() {
    return untInterface.getSubjects();
  }

}
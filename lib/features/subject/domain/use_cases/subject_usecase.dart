import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/subject/domain/interface/subject_interface.dart';

class SubjectUseCase extends UseCaseWithoutParams<List<SubjectEntity>> {
  final SubjectInterface subjectInterface;
  SubjectUseCase(this.subjectInterface);
  @override
  ResultFuture<List<SubjectEntity>> call() async {
    return await subjectInterface.getSubjects();
  }

}
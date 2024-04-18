import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/domain/entities/attempt_entity.dart';
import 'package:iu/features/stat/domain/entities/subject_result_entity.dart';

class ResultByAttemptIdEntity extends Equatable {
  final AttemptEntity attempt;
  final List<SubjectEntity>? subjects;
  final List<SubjectResultEntity>? subjectResult;

  const ResultByAttemptIdEntity(
      {required this.attempt, this.subjects, this.subjectResult});

  @override
  List<Object?> get props => [attempt,subjects,subjectResult];

}

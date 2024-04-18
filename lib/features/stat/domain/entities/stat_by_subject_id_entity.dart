import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/stat/domain/entities/stat_by_subject_entity.dart';
import 'package:iu/features/stat/domain/entities/subject_stat_entity.dart';

class StatBySubjectIdEntity extends Equatable {
  final SubjectEntity subject;
  final List<StatBySubjectEntity> statBySubject;

  StatBySubjectIdEntity({required this.subject, required this.statBySubject});

  @override
  List<Object?> get props => [subject, statBySubject];
}

import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/domain/entities/attempt_entity.dart';
import 'package:iu/features/stat/domain/entities/stat_by_attempt_entity.dart';

class StatByAttemptIdEntity extends Equatable {
  final AttemptEntity attempt;
  final List<SubjectEntity> subjects;
  final List<StatByAttemptEntity> statByAttempt;

  const StatByAttemptIdEntity(
      {required this.attempt,
      required this.subjects,
      required this.statByAttempt});

  @override
  List<Object?> get props => [attempt, subjects, statByAttempt];
}

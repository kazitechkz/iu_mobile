import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/subject.dart';

class ProposeSubjectForBattleEntity extends Equatable{
  final int? chosenSubject;
  final List<SubjectEntity>? subjects;

  const ProposeSubjectForBattleEntity({this.chosenSubject, this.subjects});

  @override
  List<Object?> get props => [chosenSubject,subjects];
}
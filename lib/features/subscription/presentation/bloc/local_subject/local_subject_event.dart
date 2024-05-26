part of 'local_subject_bloc.dart';

sealed class LocalSubjectEvent extends Equatable {
  const LocalSubjectEvent();
}

class GetLocalSubjectsEvent extends LocalSubjectEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetSelectedLocalSubjectsEvent extends LocalSubjectEvent {
  final List<LocalSubjectEntity> subjects;
  final int id;
  const GetSelectedLocalSubjectsEvent(this.subjects, this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [subjects, id];
}
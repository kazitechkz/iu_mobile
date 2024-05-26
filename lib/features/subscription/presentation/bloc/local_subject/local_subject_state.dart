part of 'local_subject_bloc.dart';

sealed class LocalSubjectState extends Equatable {
  const LocalSubjectState();
}

final class LocalSubjectInitial extends LocalSubjectState {
  @override
  List<Object> get props => [];
}

class LocalSubjectLoading extends LocalSubjectState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LocalSubjectLoaded extends LocalSubjectState {
  final List<LocalSubjectEntity> subjects;
  const LocalSubjectLoaded(this.subjects);
  @override
  // TODO: implement props
  List<Object?> get props => [subjects];
}

class GetSelectedLocalSubjectLoaded extends LocalSubjectState {
  final List<LocalSubjectEntity> subjects;
  const GetSelectedLocalSubjectLoaded(this.subjects);
  @override
  // TODO: implement props
  List<Object?> get props => [subjects];
}

class GetSelectedLocalSubjectsError extends LocalSubjectState {
  final String message;
  const GetSelectedLocalSubjectsError(this.message);
  @override
  List<Object> get props => [message];
}
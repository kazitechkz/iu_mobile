part of 'unt_bloc.dart';

abstract class UntState extends Equatable {
  const UntState();
}

class UntInitialState extends UntState {
  @override
  List<Object> get props => [];
}

class UntLoadingState extends UntState {
  @override
  List<Object> get props => [];
}

class UntSubjectLoadedState extends UntState{
  final List<SubjectEntity> subjects;
  const UntSubjectLoadedState(this.subjects);
  @override
  List<Object?> get props => [subjects];

}

class UntFailedState extends UntState{
  final FailureData failureData;
  const UntFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData.message,failureData.statusCode];

}
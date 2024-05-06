part of 'sub_step_bloc.dart';

abstract class SubStepState extends Equatable {
  const SubStepState();
}

final class SubStepInitial extends SubStepState {
  @override
  List<Object> get props => [];
}

class SubStepLoading extends SubStepState {
  @override
  List<Object> get props => [];
}

class SubStepLoaded extends SubStepState {
  final List<SubStepEntity> subStepEntities;
  const SubStepLoaded(this.subStepEntities);
  @override
  List<Object?> get props => [subStepEntities];
}

class SubStepErrorState extends SubStepState {
  final FailureData failureData;
  const SubStepErrorState(this.failureData);
  @override
  List<Object> get props => [failureData];
}

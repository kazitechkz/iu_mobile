part of 'step_bloc.dart';

abstract class StepState extends Equatable {
  const StepState();
}

class StepInitialState extends StepState {
  @override
  List<Object> get props => [];
}

class StepLoadingState extends StepState {
  @override
  List<Object> get props => [];
}

class StepInState extends StepState {
  final List<MainStepEntity> stepEntities;
  const StepInState(this.stepEntities);
  @override
  List<Object?> get props => [stepEntities];
}

class StepErrorState extends StepState {
  FailureData failureData;
  StepErrorState(this.failureData);
  @override
  List<Object> get props => [];
}

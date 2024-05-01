part of 'step_detail_bloc.dart';

sealed class StepDetailState extends Equatable {
  const StepDetailState();
}

final class StepDetailInitial extends StepDetailState {
  @override
  List<Object> get props => [];
}

class StepDetailLoading extends StepDetailState {
  @override
  List<Object> get props => [];
}

class StepDetailLoaded extends StepDetailState {
  final List<StepEntity> stepEntities;
  const StepDetailLoaded(this.stepEntities);
  @override
  List<Object?> get props => [stepEntities];
}

class StepDetailErrorState extends StepDetailState {
  final FailureData failureData;
  const StepDetailErrorState(this.failureData);
  @override
  List<Object> get props => [failureData];
}

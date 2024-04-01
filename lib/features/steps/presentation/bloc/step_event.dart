part of 'step_bloc.dart';

abstract class StepEvent extends Equatable {
  const StepEvent();
}

class StepInEvent extends StepEvent {
  const StepInEvent();
  @override
  List<Object?> get props => [];
}

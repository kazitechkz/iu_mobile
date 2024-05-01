part of 'step_detail_bloc.dart';

abstract class StepDetailEvent extends Equatable {
  const StepDetailEvent();
}

class GetStepDetailEvent extends StepDetailEvent {
  final String stepID;
  const GetStepDetailEvent(this.stepID);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

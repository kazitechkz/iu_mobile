part of 'sub_step_bloc.dart';

abstract class SubStepEvent extends Equatable {
  const SubStepEvent();
}

class GetSubStepsEvent extends SubStepEvent {
  final String stepID;
  const GetSubStepsEvent(this.stepID);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
part of 'sub_step_detail_bloc.dart';

abstract class SubStepDetailEvent extends Equatable {
  const SubStepDetailEvent();
}

class GetSubStepDetailEvent extends SubStepDetailEvent {
  final String subStepId;
  const GetSubStepDetailEvent(this.subStepId);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
part of 'sub_step_detail_bloc.dart';

abstract class SubStepDetailState extends Equatable {
  const SubStepDetailState();
}

final class SubStepDetailInitial extends SubStepDetailState {
  @override
  List<Object> get props => [];
}

class SubStepDetailLoading extends SubStepDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubStepDetailLoaded extends SubStepDetailState {
  final SubStepEntity entity;
  const SubStepDetailLoaded(this.entity);
  @override
  // TODO: implement props
  List<Object?> get props => [entity];
}

class SubStepDetailErrorState extends SubStepDetailState {
  final FailureData failureData;
  const SubStepDetailErrorState(this.failureData);
  @override
  List<Object> get props => [failureData];
}

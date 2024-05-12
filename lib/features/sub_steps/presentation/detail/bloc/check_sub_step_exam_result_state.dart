part of 'check_sub_step_exam_result_bloc.dart';

abstract class CheckSubStepExamResultState extends Equatable {
  const CheckSubStepExamResultState();
}

final class CheckSubStepExamResultInitial extends CheckSubStepExamResultState {
  @override
  List<Object> get props => [];
}

final class CheckResultLoading extends CheckSubStepExamResultState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class CheckResultLoaded extends CheckSubStepExamResultState {
  final bool result;
  const CheckResultLoaded(this.result);
  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class CheckResultErrorState extends CheckSubStepExamResultState {
  final FailureData failureData;
  const CheckResultErrorState(this.failureData);
  @override
  List<Object> get props => [failureData];
}

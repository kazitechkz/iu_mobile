part of 'sub_step_exam_result_bloc.dart';

sealed class SubStepExamResultState extends Equatable {
  const SubStepExamResultState();
}

final class SubStepExamResultInitial extends SubStepExamResultState {
  @override
  List<Object> get props => [];
}

final class SubStepExamResultLoading extends SubStepExamResultState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SubStepExamResultLoaded extends SubStepExamResultState {
  final SubStepExamResultEntity subStepExamResults;
  const SubStepExamResultLoaded(this.subStepExamResults);
  @override
  // TODO: implement props
  List<Object?> get props => [subStepExamResults];
}

final class SubStepExamResultError extends SubStepExamResultState {
  final FailureData failureData;
  const SubStepExamResultError(this.failureData);
  @override
  List<Object> get props => [failureData];
}

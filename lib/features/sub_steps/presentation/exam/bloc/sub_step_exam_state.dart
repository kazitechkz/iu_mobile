part of 'sub_step_exam_bloc.dart';

sealed class SubStepExamState extends Equatable {
  const SubStepExamState();
}

final class SubStepExamInitial extends SubStepExamState {
  @override
  List<Object> get props => [];
}

final class SubStepExamLoading extends SubStepExamState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SubStepExamLoaded extends SubStepExamState {
  final List<SubStepExamEntity> subStepExams;
  const SubStepExamLoaded(this.subStepExams);
  @override
  // TODO: implement props
  List<Object?> get props => [subStepExams];
}

class SubStepExamErrorState extends SubStepExamState {
  final FailureData failureData;
  const SubStepExamErrorState(this.failureData);
  @override
  List<Object> get props => [failureData];
}
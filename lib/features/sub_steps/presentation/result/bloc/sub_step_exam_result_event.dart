part of 'sub_step_exam_result_bloc.dart';

sealed class SubStepExamResultEvent extends Equatable {
  const SubStepExamResultEvent();
}

class GetSubStepExamResultEvent extends SubStepExamResultEvent {
  final SubStepExamParameters params;
  const GetSubStepExamResultEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}

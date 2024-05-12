part of 'check_sub_step_exam_result_bloc.dart';

abstract class CheckSubStepExamResultEvent extends Equatable {
  const CheckSubStepExamResultEvent();
}

class CheckExamResultEvent extends CheckSubStepExamResultEvent {
  final SubStepExamParameters params;
  const CheckExamResultEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}
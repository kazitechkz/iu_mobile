part of 'sub_step_exam_bloc.dart';

sealed class SubStepExamEvent extends Equatable {
  const SubStepExamEvent();
}

class GetExamTestsEvent extends SubStepExamEvent {
  final SubStepExamParameters params;
  const GetExamTestsEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}
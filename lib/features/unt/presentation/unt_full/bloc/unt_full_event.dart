part of 'unt_full_bloc.dart';

abstract class UntFullEvent extends Equatable {
  const UntFullEvent();
}

class UntFullGetSubjectsEvent extends UntFullEvent{
  @override
  List<Object?> get props => [];
}


class UntFullAddSubjectsEvent extends UntFullEvent{
  final List<int> subjectIDS;
  const UntFullAddSubjectsEvent(this.subjectIDS);
  @override
  List<Object?> get props => [];
}

class UntFullUpdateLocaleIdEvent extends UntFullEvent{
  final int localeId;
  const UntFullUpdateLocaleIdEvent(this.localeId);
  @override
  List<Object?> get props => [];
}
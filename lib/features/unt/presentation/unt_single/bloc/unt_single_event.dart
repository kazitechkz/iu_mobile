import 'package:equatable/equatable.dart';
import '../../../../attempt/domain/parameters/create_attempt_parameter.dart';

abstract class UntSingleEvent extends Equatable {
  const UntSingleEvent();
}

class UntSingleGetSubjectsEvent extends UntSingleEvent {
  @override
  List<Object?> get props => [];
}

class UntSingleAddSubjectsEvent extends UntSingleEvent {
  final List<int> subjectIDS;
  const UntSingleAddSubjectsEvent(this.subjectIDS);
  @override
  List<Object?> get props => [];
}

class UntSingleUpdateLocaleIdEvent extends UntSingleEvent {
  final int localeId;
  const UntSingleUpdateLocaleIdEvent(this.localeId);
  @override
  List<Object?> get props => [];
}

class UntSingleCreateAttemptEvent extends UntSingleEvent {
  final CreateAttemptParameter parameter;
  const UntSingleCreateAttemptEvent(this.parameter);
  @override
  List<Object?> get props => [];
}

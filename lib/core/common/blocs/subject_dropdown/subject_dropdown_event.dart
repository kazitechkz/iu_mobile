part of 'subject_dropdown_bloc.dart';

sealed class SubjectDropdownEvent extends Equatable {
  const SubjectDropdownEvent();
}

final class SubjectDropdownLoadedEvent extends SubjectDropdownEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SubjectDropdownValueChanged extends SubjectDropdownEvent {
  final String newValue;
  const SubjectDropdownValueChanged(this.newValue);
  @override
  // TODO: implement props
  List<Object?> get props => [newValue];
}

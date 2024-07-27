part of 'subject_dropdown_bloc.dart';

sealed class SubjectDropdownState extends Equatable {
  const SubjectDropdownState();
}

final class SubjectDropdownInitial extends SubjectDropdownState {
  @override
  List<Object> get props => [];
}

final class SubjectDropdownLoaded extends SubjectDropdownState {
  final List<LocalSubjectEntity> subjects;
  const SubjectDropdownLoaded(this.subjects);
  @override
  // TODO: implement props
  List<Object?> get props => [subjects];
}

final class SubjectDropdownChanged extends SubjectDropdownState {
  final String selectedValue;
  const SubjectDropdownChanged(this.selectedValue);
  @override
  // TODO: implement props
  List<Object?> get props => [selectedValue];

}

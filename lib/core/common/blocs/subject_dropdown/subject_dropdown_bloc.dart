import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/helpers/subject_helper.dart';

part 'subject_dropdown_event.dart';
part 'subject_dropdown_state.dart';

class SubjectDropdownBloc extends Bloc<SubjectDropdownEvent, SubjectDropdownState> {
  SubjectDropdownBloc() : super(SubjectDropdownInitial()) {
    on<SubjectDropdownLoadedEvent>(_handleSubjectDropdownLoad);
    on<SubjectDropdownValueChanged>(_handleChangeValueSubjectDropdown);
  }

  Future<void> _handleSubjectDropdownLoad(SubjectDropdownLoadedEvent event, Emitter<SubjectDropdownState> emit) async {
    List<LocalSubjectEntity> subjects = SubjectHelper.getSubjects();
    emit(SubjectDropdownLoaded(subjects));
  }

  Future<void> _handleChangeValueSubjectDropdown(SubjectDropdownValueChanged event, Emitter<SubjectDropdownState> emit) async {
    emit(SubjectDropdownChanged(event.newValue));
  }
}

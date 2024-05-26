import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/errors/failure.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/subject.dart';
import '../../../../../core/helpers/subject_helper.dart';

part 'local_subject_event.dart';

part 'local_subject_state.dart';

class LocalSubjectBloc extends Bloc<LocalSubjectEvent, LocalSubjectState> {
  LocalSubjectBloc() : super(LocalSubjectInitial()) {
    on<GetLocalSubjectsEvent>(_handleGetLocalSubjects);
    on<GetSelectedLocalSubjectsEvent>(_handleGetSelectedLocalSubjects);
  }

  Future<void> _handleGetLocalSubjects(
      GetLocalSubjectsEvent event, Emitter<LocalSubjectState> emit) async {
    emit(LocalSubjectLoading());
    emit(LocalSubjectLoaded(SubjectHelper.getSubjects()));
  }

  Future<void> _handleGetSelectedLocalSubjects(
      GetSelectedLocalSubjectsEvent event,
      Emitter<LocalSubjectState> emit) async {
    emit(LocalSubjectLoading());
    List<LocalSubjectEntity> subjects = event.subjects;
    List<LocalSubjectEntity> selectedSubjects =
        subjects.where((subject) => subject.isSelected).toList();
    if (selectedSubjects.length < 2 ||
        subjects
            .any((subject) => subject.id == event.id && subject.isSelected)) {
      final updatedSubjects = subjects.map((subject) {
        if (subject.id == event.id) {
          return subject.copyWith(isSelected: !subject.isSelected);
        }
        return subject;
      }).toList();
      emit(LocalSubjectLoaded(updatedSubjects));
    } else {
      emit(const GetSelectedLocalSubjectsError('Error'));
      emit(LocalSubjectLoaded(subjects));
    }
  }
}

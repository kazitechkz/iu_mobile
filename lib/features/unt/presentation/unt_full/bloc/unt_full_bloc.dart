import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/parameters/create_attempt_parameter.dart';
import 'package:iu/features/unt/domain/use_cases/get_subjects_case.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/subject.dart';
part 'unt_full_event.dart';
part 'unt_full_state.dart';

class UntFullBloc extends Bloc<UntFullEvent, UntFullState> {
  UntFullBloc({required GetSubjectsCase getSubjectsCase})
      : _getSubjectsCase = getSubjectsCase,
        super(UntFullInitialState())
  {
      on<UntFullGetSubjectsEvent>(_handleGetSubjectEvent);
      on<UntFullAddSubjectsEvent>(_handleAddSubjectsEvent);
      on<UntFullUpdateLocaleIdEvent>(_handleUpdateLocaleIdEvent);
  }

  final GetSubjectsCase _getSubjectsCase;

  Future<void> _handleGetSubjectEvent(UntFullGetSubjectsEvent event, Emitter<UntFullState> emit)async{
    final result = await _getSubjectsCase();
    result.fold(
            (l) => emit(UntFullFailedState(FailureData(statusCode: l.statusCode,message: l.message,errors: l.errors))),
            (r) => emit(UntFullSubjectLoadedState(r))
    );
  }

  Future<void> _handleAddSubjectsEvent(UntFullAddSubjectsEvent event, Emitter<UntFullState> emit)async{
    if (state.parameter != null) {
      var currentState = state as UntFullSubjectLoadedState;
      emit(currentState.copyWith(subjects: event.subjectIDS));
    }
  }

  Future<void> _handleUpdateLocaleIdEvent(UntFullUpdateLocaleIdEvent event, Emitter<UntFullState> emit)async{
    if (state.parameter != null) {
      var currentState = state as UntFullSubjectLoadedState;
      emit(currentState.copyWith(localeId: event.localeId));
    }
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iu/features/attempt/domain/use_cases/create_attempt_case.dart';
import 'package:iu/features/unt/domain/use_cases/get_subjects_case.dart';
import 'package:iu/features/unt/presentation/unt_single/bloc/unt_single_event.dart';
import 'package:iu/features/unt/presentation/unt_single/bloc/unt_single_state.dart';
import '../../../../../core/common/models/failure_data.dart';

class UntSingleBloc extends Bloc<UntSingleEvent, UntSingleState> {
  UntSingleBloc({
    required GetSubjectsCase getSubjectsCase,
    required CreateAttemptCase createAttemptCase,
  })  : _getSubjectsCase = getSubjectsCase,
        _createAttemptCase = createAttemptCase,
        super(UntSingleInitialState()) {
    on<UntSingleGetSubjectsEvent>(_handleGetSubjectEvent);
    on<UntSingleAddSubjectsEvent>(_handleAddSubjectsEvent);
    on<UntSingleUpdateLocaleIdEvent>(_handleUpdateLocaleIdEvent);
    on<UntSingleCreateAttemptEvent>(_handleCreateAttemptEvent);
  }

  final GetSubjectsCase _getSubjectsCase;
  final CreateAttemptCase _createAttemptCase;

  Future<void> _handleGetSubjectEvent(
      UntSingleGetSubjectsEvent event, Emitter<UntSingleState> emit) async {
    final result = await _getSubjectsCase();
    result.fold(
        (l) => emit(UntSingleFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(UntSingleSubjectLoadedState(r)));
  }

  Future<void> _handleAddSubjectsEvent(
      UntSingleAddSubjectsEvent event, Emitter<UntSingleState> emit) async {
    if (state.parameter != null) {
      var currentState = state as UntSingleSubjectLoadedState;
      emit(currentState.copyWith(subjects: event.subjectIDS));
    }
  }

  Future<void> _handleUpdateLocaleIdEvent(
      UntSingleUpdateLocaleIdEvent event, Emitter<UntSingleState> emit) async {
    if (state.parameter != null) {
      var currentState = state as UntSingleSubjectLoadedState;
      emit(currentState.copyWith(localeId: event.localeId));
    }
  }

  Future<void> _handleCreateAttemptEvent(
      UntSingleCreateAttemptEvent event, Emitter<UntSingleState> emit) async {
    emit(UntSingleLoadingState());
    final result = await _createAttemptCase(event.parameter);
    result.fold(
        (l) => emit(UntSingleFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(UntSingleAttemptCreatedState(r)));
  }
}

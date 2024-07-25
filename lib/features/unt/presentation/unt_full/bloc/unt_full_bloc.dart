import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/parameters/create_attempt_parameter.dart';
import 'package:iu/features/attempt/domain/use_cases/create_attempt_case.dart';
import 'package:iu/features/unt/domain/use_cases/get_subjects_case.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/subject.dart';
part 'unt_full_event.dart';
part 'unt_full_state.dart';

class UntFullBloc extends Bloc<UntFullEvent, UntFullState> {
  UntFullBloc({
    required GetSubjectsCase getSubjectsCase,
    required CreateAttemptCase createAttemptCase,
  })  : _getSubjectsCase = getSubjectsCase,
        _createAttemptCase = createAttemptCase,
        super(UntFullInitialState()) {
    on<UntFullGetSubjectsEvent>(_handleGetSubjectEvent);
    on<UntFullAddSubjectsEvent>(_handleAddSubjectsEvent);
    on<UntFullUpdateLocaleIdEvent>(_handleUpdateLocaleIdEvent);
    on<UntFullCreateAttemptEvent>(_handleCreateAttemptEvent);
  }

  final GetSubjectsCase _getSubjectsCase;
  final CreateAttemptCase _createAttemptCase;

  Future<void> _handleGetSubjectEvent(
      UntFullGetSubjectsEvent event, Emitter<UntFullState> emit) async {
    final result = await _getSubjectsCase();
    result.fold(
        (l) => emit(UntFullFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(UntFullSubjectLoadedState(
            subjects: r,
            complusory_subjects:
                r.where((element) => element.is_compulsory == 1).toList(),
            not_complusory_subjects:
                r.where((element) => element.is_compulsory != 1).toList())));
  }

  Future<void> _handleAddSubjectsEvent(
      UntFullAddSubjectsEvent event, Emitter<UntFullState> emit) async {
    if (state.parameter != null) {
      var currentState = state as UntFullSubjectLoadedState;
      emit(currentState.copyWith(subjects: event.subjectIDS));
    }
  }

  Future<void> _handleUpdateLocaleIdEvent(
      UntFullUpdateLocaleIdEvent event, Emitter<UntFullState> emit) async {
    if (state.parameter != null) {
      var currentState = state as UntFullSubjectLoadedState;
      emit(currentState.copyWith(localeId: event.localeId));
    }
  }

  Future<void> _handleCreateAttemptEvent(
      UntFullCreateAttemptEvent event, Emitter<UntFullState> emit) async {
    emit(UntFullLoadingState());
    final result = await _createAttemptCase(event.parameter);
    result.fold(
        (l) => emit(UntFullFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(UntFullAttemptCreatedState(r)));
  }
}

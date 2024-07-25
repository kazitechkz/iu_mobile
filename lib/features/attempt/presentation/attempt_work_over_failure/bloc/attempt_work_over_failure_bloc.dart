import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/attempt_common_entity.dart';
import '../../../domain/entities/attempt_entity.dart';
import '../../../domain/entities/attempt_question_entity.dart';
import '../../../domain/parameters/save_question_parameter.dart';
import '../../../domain/use_cases/get_attempt_stat_case.dart';
import '../../../domain/use_cases/save_question_case.dart';

part 'attempt_work_over_failure_event.dart';
part 'attempt_work_over_failure_state.dart';

class AttemptWorkOverFailureBloc
    extends Bloc<AttemptWorkOverFailureEvent, AttemptWorkOverFailureState> {
  AttemptWorkOverFailureBloc({
    required GetAttemptStatCase getAttemptStatCase,
    required SaveQuestionCase saveQuestionCase,
  })  : _getAttemptStatCase = getAttemptStatCase,
        _saveQuestionCase = saveQuestionCase,
        super(AttemptWorkOverFailureInitialState()) {
    on<AttemptWorkOverFailureGetByAttemptIdEvent>(
        _handleAttemptWorkOverFailureGetByAttemptIdEvent);
    on<AttemptWorkOverFailureChangeSubjectEvent>(
        _handleAttemptWorkOverFailureChangeSubjectEvent);
    on<AttemptWorkOverFailureSliderChangeEvent>(
        _handleAttemptWorkOverFailureSliderChangeEvent);
    on<AttemptWorkOverFailureSaveQuestionEvent>(
        _handleAttemptWorkOverFailureSaveQuestionEvent);
  }

  final GetAttemptStatCase _getAttemptStatCase;
  final SaveQuestionCase _saveQuestionCase;

  Future<void> _handleAttemptWorkOverFailureGetByAttemptIdEvent(
      AttemptWorkOverFailureGetByAttemptIdEvent event,
      Emitter<AttemptWorkOverFailureState> emit) async {
    emit(AttemptWorkOverFailureLoadingState());
    final result = await this._getAttemptStatCase(event.attemptId);
    result.fold(
        (l) => emit(
            AttemptWorkOverFailureFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(AttemptWorkOverFailureSuccessState(
              attemptQuestions: r.attemptQuestions,
              attempt: r.attempt,
              result: r.result,
            )));
  }

  void _handleAttemptWorkOverFailureChangeSubjectEvent(
      AttemptWorkOverFailureChangeSubjectEvent event,
      Emitter<AttemptWorkOverFailureState> emit) {
    if (state is AttemptWorkOverFailureSuccessState) {
      final currentState = state as AttemptWorkOverFailureSuccessState;
      emit(currentState.copyWith(SubjectId: event.subjectId));
    }
  }

  void _handleAttemptWorkOverFailureSliderChangeEvent(
      AttemptWorkOverFailureSliderChangeEvent event,
      Emitter<AttemptWorkOverFailureState> emit) {
    if (state is AttemptWorkOverFailureSuccessState) {
      final currentState = state as AttemptWorkOverFailureSuccessState;
      emit(currentState.copyWith(ActiveSlider: event.activeSliderId));
    }
  }

  Future<void> _handleAttemptWorkOverFailureSaveQuestionEvent(
      AttemptWorkOverFailureSaveQuestionEvent event,
      Emitter<AttemptWorkOverFailureState> emit) async {
    if (state is AttemptWorkOverFailureSuccessState) {
      final currentState = state as AttemptWorkOverFailureSuccessState;
      final savedQuestionsId = currentState.savedQuestionId;
      final result =
          await _saveQuestionCase(SaveQuestionParameter(event.questionId));
      result.fold(
          (l) => emit(currentState.copyWith(
              SavedQuestionId: [...savedQuestionsId, event.questionId])),
          (r) => emit(currentState.copyWith(
              SavedQuestionId: [...savedQuestionsId, event.questionId])));
    }
  }
}

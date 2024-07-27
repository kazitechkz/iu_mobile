import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/errors/failure.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/career_quiz_entity.dart';
import '../../../domain/use_cases/finish_career_case.dart';
import '../../../domain/use_cases/pass_career_quiz_case.dart';

part 'pass_career_drag_drop_event.dart';
part 'pass_career_drag_drop_state.dart';

class PassCareerDragDropBloc
    extends Bloc<PassCareerDragDropEvent, PassCareerDragDropState> {
  PassCareerDragDropBloc(
      {required FinishCareerCase finishCareerCase,
      required PassCareerQuizCase passCareerQuizCase})
      : this._finishCareerCase = finishCareerCase,
        this._passCareerQuizCase = passCareerQuizCase,
        super(PassCareerDragDropInitialState()) {
    on<PassCareerDragDropGetCareerByIdEvent>(
        _handlePassCareerDragDropGetCareerByIdEvent);
    on<PassCareerDragDropChangeSliderEvent>(
        _handlePassCareerDragDropChangeSliderEvent);
    on<PassCareerDragDropSelectAnswerEvent>(
        _handlePassCareerDragDropSelectAnswerEvent);
  }

  final FinishCareerCase _finishCareerCase;
  final PassCareerQuizCase _passCareerQuizCase;

  Future<void> _handlePassCareerDragDropGetCareerByIdEvent(
      PassCareerDragDropGetCareerByIdEvent event,
      Emitter<PassCareerDragDropState> emit) async {
    emit(PassCareerDragDropLoadingState());
    var result = await this._passCareerQuizCase(event.quizId);
    result.fold(
        (l) =>
            emit(PassCareerDragDropFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(PassCareerDragDropSuccessState(passCareerQuiz: r)));
  }

  void _handlePassCareerDragDropChangeSliderEvent(
      PassCareerDragDropChangeSliderEvent event,
      Emitter<PassCareerDragDropState> emit) {
    if (state is PassCareerDragDropSuccessState) {
      final currentState = state as PassCareerDragDropSuccessState;
      emit(currentState.copyWith(PageIndex: event.pageIndex));
    }
  }

  void _handlePassCareerDragDropSelectAnswerEvent(
      PassCareerDragDropSelectAnswerEvent event,
      Emitter<PassCareerDragDropState> emit) {
    if (state is PassCareerDragDropSuccessState) {
      final currentState = state as PassCareerDragDropSuccessState;
      var givenAnswer = Map<int, Map<int, int>>.from(currentState.givenAnswer);
      if (event.answerValue != null) {
        if (givenAnswer.keys.contains(event.questionId)) {
          givenAnswer[event.questionId]?[event.answerId] =
              event.answerValue ?? 0;
        } else {
          givenAnswer[event.questionId] = {
            event.answerId: event.answerValue ?? 0
          };
        }
      } else {
        if (givenAnswer.keys.contains(event.questionId)) {
          givenAnswer[event.questionId]?.remove(event.answerId);
        }
      }
      emit(currentState.copyWith(GivenAnswer: givenAnswer));
    }
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/career_quiz_entity.dart';
import '../../../domain/parameters/finish_career_quiz_parameter.dart';
import '../../../domain/use_cases/finish_career_case.dart';
import '../../../domain/use_cases/pass_career_quiz_case.dart';

part 'pass_career_one_event.dart';

part 'pass_career_one_state.dart';

class PassCareerOneBloc extends Bloc<PassCareerOneEvent, PassCareerOneState> {
  PassCareerOneBloc(
      {required FinishCareerCase finishCareerCase,
      required PassCareerQuizCase passCareerQuizCase})
      : this._finishCareerCase = finishCareerCase,
        this._passCareerQuizCase = passCareerQuizCase,
        super(PassCareerOneInitialState()) {
    on<PassCareerOneGetAllEvent>(_handlePassCareerOneGetAllEvent);
    on<PassCareerOneGiveAnswerEvent>(_handlePassCareerOneGiveAnswerEvent);
    on<PassCareerOneFinishEvent>(_handlePassCareerOneFinishEvent);
    on<PassCareerOneChangeSliderEvent>(_handlePassCareerOneChangeSliderEvent);
  }

  final FinishCareerCase _finishCareerCase;
  final PassCareerQuizCase _passCareerQuizCase;

  Future<void> _handlePassCareerOneGetAllEvent(
      PassCareerOneGetAllEvent event, Emitter<PassCareerOneState> emit) async {
    emit(PassCareerOneLoadingState());
    final result = await _passCareerQuizCase(event.quizId);
    result.fold(
        (l) => emit(PassCareerOneFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(
            PassCareerOneSuccessState(careerQuizEntity: r, givenAnswer: {})));
  }

  Future<void> _handlePassCareerOneGiveAnswerEvent(
      PassCareerOneGiveAnswerEvent event,
      Emitter<PassCareerOneState> emit) async {
    if (state is PassCareerOneSuccessState) {
      final currentState = state as PassCareerOneSuccessState;
      final givenAnswer = currentState.givenAnswer;
      final answers = Map<int, int>.from(currentState.answers);
      givenAnswer[event.questionId] = event.answerId;
      answers[event.questionId] =
          (event.answerId + event.questionId + event.answerValue);
      emit(currentState.copyWith(
        CareerQuizEntity: currentState.careerQuizEntity,
        GivenAnswer: Map<int, int>.from(givenAnswer),
        Answers: Map<int, int>.from(answers),
      ));
    }
  }

  Future<void> _handlePassCareerOneFinishEvent(
      PassCareerOneFinishEvent event, Emitter<PassCareerOneState> emit) async {
    if (state is PassCareerOneSuccessState) {
      final currentState = state as PassCareerOneSuccessState;
      emit(PassCareerOneLoadingState());
      final result = await _finishCareerCase(event.parameter);
      result.fold(
          (l) => emit(PassCareerOneFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(PassCareerOneFinishedState(resultId: r)));
    }
  }

  void _handlePassCareerOneChangeSliderEvent(
      PassCareerOneChangeSliderEvent event, Emitter<PassCareerOneState> emit) {
    if (state is PassCareerOneSuccessState) {
      final currentState = state as PassCareerOneSuccessState;
      emit(currentState.copyWith(PageIndex: event.pageIndex));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:iu/features/attempt/domain/parameters/answered_result_parameter.dart';
import 'package:iu/features/attempt/domain/use_cases/finish_attempt_case.dart';
import 'package:iu/features/attempt/domain/use_cases/get_attempt_case.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_event.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_state.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/answer_result_entity.dart';
import '../../../domain/use_cases/answer_case.dart';
import '../../../domain/use_cases/answer_result_case.dart';

class PassAttemptBloc extends Bloc<PassAttemptEvent, PassAttemptState> {
  PassAttemptBloc({
    required GetAttemptCase attemptCase,
    required AnswerCase answerCase,
    required AnswerResultCase answerResultCase,
    required FinishAttemptCase finishAttemptCase,
  })  : _attemptCase = attemptCase,
        _answerCase = answerCase,
        _answerResultCase = answerResultCase,
        _finishAttemptCase = finishAttemptCase,
        super(PassAttemptInitialState()) {
    on<PassAttemptGetByAttemptIdEvent>(_handlePassAttemptGetByAttemptIdEvent);
    on<PassAttemptGetAnsweredEvent>(_handlePassAttemptGetAnsweredEvent);
    on<PassAttemptChangeSubjectEvent>(_handlePassAttemptChangeSubjectEvent);
    on<PassAttemptAnswerQuestionEvent>(_handlePassAttemptAnswerQuestionEvent);
    on<PassAttemptAnswerEvent>(_handlePassAttemptAnswerEvent);
    on<PassAttemptCarouselSliderChangeEvent>(
        _handlePassAttemptCarouselSliderChangeEvent);
    on<PassAttemptFinishAttemptEvent>(_handlePassAttemptFinishAttemptEvent);
  }
  final GetAttemptCase _attemptCase;
  final AnswerCase _answerCase;
  final AnswerResultCase _answerResultCase;
  final FinishAttemptCase _finishAttemptCase;

  Future<void> _handlePassAttemptGetByAttemptIdEvent(
      PassAttemptGetByAttemptIdEvent event,
      Emitter<PassAttemptState> emit) async {
    emit(PassAttemptLoadingState());
    final result = await _attemptCase(event.attemptId);
    result.fold(
        (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(PassAttemptSuccessState(r, timeLeftMS: r.timeLeft)));
  }

  Future<void> _handlePassAttemptAnswerEvent(
      PassAttemptAnswerEvent event, Emitter<PassAttemptState> emit) async {
    final currentState = state as PassAttemptSuccessState;
    final answeredQuestionsIDNEW =
        Map<int, List<String>>.from(currentState.answeredQuestionsID);
    answeredQuestionsIDNEW[event.parameter.question_id] =
        event.parameter.answers.split(",");
    final result = await _answerCase(event.parameter);
    result.fold(
        (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => r.isFinished
            ? emit(PassAttemptFinishedState())
            : emit(currentState.copyWith(
                answerResult: r,
                answeredQuestionsID: answeredQuestionsIDNEW,
                timeLeft: r.timeLeft)));
  }

  Future<void> _handlePassAttemptFinishAttemptEvent(
      PassAttemptFinishAttemptEvent event,
      Emitter<PassAttemptState> emit) async {
    final result = await _finishAttemptCase(event.attemptId);
    result.fold(
        (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(PassAttemptFinishedState()));
  }

  Future<void> _handlePassAttemptGetAnsweredEvent(
      PassAttemptGetAnsweredEvent event, Emitter<PassAttemptState> emit) async {
    final currentState = state as PassAttemptSuccessState;
    final result = await _answerResultCase(
        AnsweredResultParameter(attempt_subject_id: event.attemptSubjectId));
    result.fold(
        (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(currentState.copyWith(answeredResult: r)));
  }

  void _handlePassAttemptChangeSubjectEvent(
      PassAttemptChangeSubjectEvent event, Emitter<PassAttemptState> emit) {
    if (state is PassAttemptSuccessState) {
      final currentState = state as PassAttemptSuccessState;
      emit(currentState.copyWith(subjectId: event.subjectId));
    }
  }

  void _handlePassAttemptCarouselSliderChangeEvent(
      PassAttemptCarouselSliderChangeEvent event,
      Emitter<PassAttemptState> emit) {
    if (state is PassAttemptSuccessState) {
      final currentState = state as PassAttemptSuccessState;
      emit(currentState.copyWith(activeSlider: event.activeSliderId));
    }
  }

  void _handlePassAttemptAnswerQuestionEvent(
      PassAttemptAnswerQuestionEvent event, Emitter<PassAttemptState> emit) {
    if (state is PassAttemptSuccessState) {
      final currentState = state as PassAttemptSuccessState;
      final newQuestionAnswers =
          Map<int, List<String>>.from(currentState.answeredQuestions);
      if (newQuestionAnswers.containsKey(event.questionId)) {
        if (event.typeId == 3) {
          if (newQuestionAnswers[event.questionId]!.contains(event.answer)) {
            newQuestionAnswers[event.questionId]!.remove(event.answer);
          } else {
            newQuestionAnswers[event.questionId]!.add(event.answer);
          }
        } else {
          if (newQuestionAnswers[event.questionId]!.contains(event.answer)) {
            newQuestionAnswers[event.questionId]!.remove(event.answer);
          } else {
            newQuestionAnswers[event.questionId] = [event.answer];
          }
        }
      } else {
        newQuestionAnswers[event.questionId] = [event.answer];
      }
      emit(currentState.copyWith(answeredQuestions: newQuestionAnswers));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:iu/features/attempt/domain/parameters/answered_result_parameter.dart';
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
  })
      : _attemptCase = attemptCase,
       _answerCase = answerCase,
        _answerResultCase = answerResultCase,
        super(PassAttemptInitialState()) {
    on<PassAttemptGetByAttemptIdEvent>(_handlePassAttemptGetByAttemptIdEvent);
    on<PassAttemptGetAnsweredEvent>(_handlePassAttemptGetAnsweredEvent);
    on<PassAttemptChangeSubjectEvent>(_handlePassAttemptChangeSubjectEvent);
    on<PassAttemptAnswerQuestionEvent>(_handlePassAttemptAnswerQuestionEvent);
    on<PassAttemptAnswerEvent>(_handlePassAttemptAnswerEvent);
  }
  final GetAttemptCase _attemptCase;
  final AnswerCase _answerCase;
  final AnswerResultCase _answerResultCase;

  Future<void> _handlePassAttemptGetByAttemptIdEvent(
      PassAttemptGetByAttemptIdEvent event,
      Emitter<PassAttemptState> emit) async {
    emit(PassAttemptLoadingState());
    final result = await _attemptCase(event.attemptId);
    result.fold(
        (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(PassAttemptSuccessState(r)));
  }

  Future<void> _handlePassAttemptAnswerEvent(
      PassAttemptAnswerEvent event,
      Emitter<PassAttemptState> emit) async {
    final currentState = state as PassAttemptSuccessState;
    final answeredQuestionsIDNEW = List<int>.from(currentState.answeredQuestionsID);
    answeredQuestionsIDNEW.add(event.parameter.question_id);
    emit(PassAttemptLoadingState());
    final result = await _answerCase(event.parameter);
    result.fold(
            (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
            (r) => emit(currentState.copyWith(answerResult: r,answeredQuestionsID: answeredQuestionsIDNEW)));

  }

  Future<void> _handlePassAttemptGetAnsweredEvent(
      PassAttemptGetAnsweredEvent event,
      Emitter<PassAttemptState> emit) async {
    final currentState = state as PassAttemptSuccessState;
    final result = await _answerResultCase(AnsweredResultParameter(attempt_subject_id: event.attemptSubjectId));
    result.fold(
            (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
            (r) => emit(currentState.copyWith(answeredResult: r)));

  }

  void _handlePassAttemptChangeSubjectEvent(
      PassAttemptChangeSubjectEvent event,
      Emitter<PassAttemptState> emit){
      if(state is PassAttemptSuccessState){
        final currentState = state as PassAttemptSuccessState;
        emit(currentState.copyWith(subjectId: event.subjectId));
      }
  }

  void _handlePassAttemptAnswerQuestionEvent(
      PassAttemptAnswerQuestionEvent event,
      Emitter<PassAttemptState> emit){
    if(state is PassAttemptSuccessState){
      final currentState = state as PassAttemptSuccessState;
      final newQuestionAnswers = Map<int, List<String>>.from(currentState.answeredQuestions);
      if(newQuestionAnswers.containsKey(event.questionId)){
        if(event.typeId == 3){
          if(newQuestionAnswers[event.questionId]!.contains(event.answer)){
            newQuestionAnswers[event.questionId]!.remove(event.answer);
          }
          else{
            newQuestionAnswers[event.questionId]!.add(event.answer);
          }
        }
        else{
          if(newQuestionAnswers[event.questionId]!.contains(event.answer)){
            newQuestionAnswers[event.questionId]!.remove(event.answer);
          }
          else{
            newQuestionAnswers[event.questionId] = [event.answer];
          }
        }
      }
      else{
        newQuestionAnswers[event.questionId] = [event.answer];
      }
      emit(currentState.copyWith(answeredQuestions:newQuestionAnswers));
    }
  }
}

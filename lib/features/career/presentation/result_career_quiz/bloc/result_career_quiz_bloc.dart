import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/career_quiz_attempt_entity.dart';
import '../../../domain/use_cases/result_career_quiz_case.dart';

part 'result_career_quiz_event.dart';
part 'result_career_quiz_state.dart';

class ResultCareerQuizBloc extends Bloc<ResultCareerQuizEvent, ResultCareerQuizState> {
  ResultCareerQuizBloc({
    required ResultCareerQuiz resultCareerQuiz
}) :
      _resultCareerQuiz = resultCareerQuiz,
        super(ResultCareerQuizInitialState()) {
    on<ResultCareerQuizByAttemptIdEvent>(_handleResultCareerQuizByAttemptIdEvent);
  }

  final ResultCareerQuiz _resultCareerQuiz;

  Future<void> _handleResultCareerQuizByAttemptIdEvent(ResultCareerQuizByAttemptIdEvent event, Emitter<ResultCareerQuizState> emit) async{
    emit(ResultCareerQuizLoadingState());
    final result = await _resultCareerQuiz(event.attemptId);
    result.fold(
            (l) => emit(ResultCareerQuizFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(ResultCareerQuizSuccessState(r))
    );
  }


}

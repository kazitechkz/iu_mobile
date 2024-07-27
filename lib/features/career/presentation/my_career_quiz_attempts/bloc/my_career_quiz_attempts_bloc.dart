import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';
import '../../../../../core/common/models/pagination_data.dart';
import '../../../domain/entities/career_quiz_attempt_entity.dart';
import '../../../domain/parameters/my_career_attempts_parameter.dart';
import '../../../domain/use_cases/my_career_attempts_case.dart';
part 'my_career_quiz_attempts_event.dart';

part 'my_career_quiz_attempts_state.dart';

class MyCareerQuizAttemptsBloc
    extends Bloc<MyCareerQuizAttemptsEvent, MyCareerQuizAttemptsState> {
  MyCareerQuizAttemptsBloc({required MyCareerAttemptsCase myCareerAttemptsCase})
      : _myCareerAttemptsCase = myCareerAttemptsCase,
        super(MyCareerQuizAttemptsInitialState()) {
    on<MyCareerQuizAttemptsByQuizIdEvent>(
        _handleMyCareerQuizAttemptsByQuizIdEvent);
    on<MyCareerQuizAttemptsPaginateEvent>(
        _handleMyCareerQuizAttemptsPaginateEvent);
  }

  final MyCareerAttemptsCase _myCareerAttemptsCase;

  Future<void> _handleMyCareerQuizAttemptsByQuizIdEvent(
      MyCareerQuizAttemptsByQuizIdEvent event,
      Emitter<MyCareerQuizAttemptsState> emit) async {
    if (state is MyCareerQuizAttemptsSuccessState) {
      final currentState = state as MyCareerQuizAttemptsSuccessState;
      final oldData = currentState.careerQuizzes;
      emit(currentState.copyWith(IsLoadingPagination: true));
      final result = await _myCareerAttemptsCase(event.parameter);
      result.fold(
          (l) => emit(
              MyCareerQuizAttemptsFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(
              CareerQuizPagination: r,
              CareerQuizzes: [...oldData, ...r.data])));
    } else {
      emit(MyCareerQuizAttemptsLoadingState());
      final result = await _myCareerAttemptsCase(event.parameter);
      result.fold(
          (l) => emit(
              MyCareerQuizAttemptsFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(MyCareerQuizAttemptsSuccessState(
              careerQuizPagination: r, careerQuizzes: r.data)));
    }
  }

  void _handleMyCareerQuizAttemptsPaginateEvent(
      MyCareerQuizAttemptsPaginateEvent event,
      Emitter<MyCareerQuizAttemptsState> emit) {
    if (state is MyCareerQuizAttemptsSuccessState) {
      final currentState = state as MyCareerQuizAttemptsSuccessState;
      if (currentState.isLoadingPagination == false &&
          currentState.careerQuizPagination.lastPage >
              currentState.careerQuizPagination.currentPage) {
        add(MyCareerQuizAttemptsByQuizIdEvent(MyCareerAttemptsParameter(
            page: currentState.careerQuizPagination.currentPage + 1)));
      }
    }
  }
}

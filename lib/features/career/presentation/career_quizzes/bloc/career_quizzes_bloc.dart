import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/career_quiz_entity.dart';
import '../../../domain/entities/get_career_quizzes_entity.dart';
import '../../../domain/parameters/get_career_quizzes_parameter.dart';
import '../../../domain/use_cases/get_career_quizzes_case.dart';

part 'career_quizzes_event.dart';
part 'career_quizzes_state.dart';

class CareerQuizzesBloc extends Bloc<CareerQuizzesEvent, CareerQuizzesState> {
  CareerQuizzesBloc({required GetCareerQuizzesCase getCareerQuizzesCase})
      : this._getCareerQuizzesCase = getCareerQuizzesCase,
        super(CareerQuizzesInitialState()) {
    on<GetCareerQuizzesEvent>(_handleGetCareerQuizzesEvent);
  }

  final GetCareerQuizzesCase _getCareerQuizzesCase;

  Future<void> _handleGetCareerQuizzesEvent(
      GetCareerQuizzesEvent event, Emitter<CareerQuizzesState> emit) async {
    if (state is CareerQuizzesSuccessState) {
      final currentState = state as CareerQuizzesSuccessState;
      final oldData = currentState.careerQuizzes;
      emit(currentState.copyWith(IsLoadingPagination: true));
      final result = await _getCareerQuizzesCase(event.parameter);
      result.fold(
          (l) => emit(CareerQuizzesFailureState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(
              CareerQuizzesEntity: r,
              CareerQuizzes: [...oldData, ...r.quizzes.data])));
    } else {
      emit(CareerQuizzesLoadingState());
      final result = await _getCareerQuizzesCase(event.parameter);
      result.fold(
          (l) => emit(CareerQuizzesFailureState(FailureData.fromApiFailure(l))),
          (r) => emit(CareerQuizzesSuccessState(
              careerQuizzesEntity: r, careerQuizzes: r.quizzes.data)));
    }
  }
}

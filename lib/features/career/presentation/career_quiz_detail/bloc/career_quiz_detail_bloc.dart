import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/get_career_quiz_entity.dart';
import '../../../domain/use_cases/get_career_quiz_case.dart';
part 'career_quiz_detail_event.dart';
part 'career_quiz_detail_state.dart';

class CareerQuizDetailBloc extends Bloc<CareerQuizDetailEvent, CareerQuizDetailState> {
  CareerQuizDetailBloc
      ({required GetCareerQuizCase getCareerQuizCase})
      :
        _getCareerQuizCase = getCareerQuizCase,
        super(CareerQuizDetailInitialState()) {
      on<GetCareerQuizDetailByIdEvent>(_handleGetCareerQuizDetailByIdEvent);
  }

  final GetCareerQuizCase _getCareerQuizCase;

  Future<void> _handleGetCareerQuizDetailByIdEvent(GetCareerQuizDetailByIdEvent event, Emitter<CareerQuizDetailState> emit) async{
    emit(CareerQuizDetailLoadingState());
    final result = await _getCareerQuizCase(event.quizId);
    result.fold(
            (l) => emit(CareerQuizDetailFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(CareerQuizDetailSuccessState(r))
    );
  }

}

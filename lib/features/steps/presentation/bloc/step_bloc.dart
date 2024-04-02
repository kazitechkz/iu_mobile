import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import 'package:iu/features/steps/domain/usecases/step_usecase.dart';

import '../../../../core/common/models/subject.dart';

part 'step_event.dart';

part 'step_state.dart';

class StepBloc extends Bloc<StepEvent, StepState> {
  StepBloc({required StepUseCase stepUseCase})
      : _stepUseCase = stepUseCase,
        super(StepInitialState()) {
    on<StepInEvent>(_stepInHandler);
  }

  final StepUseCase _stepUseCase;

  Future<void> _stepInHandler(
      StepInEvent event, Emitter<StepState> emit) async {
    emit(StepLoadingState());
    final result = await _stepUseCase();
    result.fold(
        (failure) => emit(StepErrorState(FailureData.fromApiFailure(failure))),
        (success) => emit(StepInState(success)));
  }
}

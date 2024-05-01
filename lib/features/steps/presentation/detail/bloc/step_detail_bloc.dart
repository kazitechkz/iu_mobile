import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/steps/domain/usecases/step_detail_usecase.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/step_entity.dart';

part 'step_detail_event.dart';
part 'step_detail_state.dart';

class StepDetailBloc extends Bloc<StepDetailEvent, StepDetailState> {
  StepDetailBloc({required StepDetailUseCase stepDetailUseCase})
      : _stepDetailUseCase = stepDetailUseCase,
        super(StepDetailInitial()) {
    on<GetStepDetailEvent>(_handleGetStepDetail);
  }

  final StepDetailUseCase _stepDetailUseCase;

  Future<void> _handleGetStepDetail(
      GetStepDetailEvent event, Emitter<StepDetailState> emit) async {
    emit(StepDetailLoading());
    final result = await _stepDetailUseCase(event.stepID.toString());
    result.fold(
            (l) => emit(StepDetailErrorState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
            (r) => emit(StepDetailLoaded(r)));
  }
}

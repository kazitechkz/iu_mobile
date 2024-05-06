import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/sub_step_entity.dart';
import '../../../domain/usecases/sub_step_usecase.dart';

part 'sub_step_event.dart';
part 'sub_step_state.dart';

class SubStepBloc extends Bloc<SubStepEvent, SubStepState> {
  final SubStepUseCase _subStepUseCase;
  SubStepBloc({required SubStepUseCase subStepUseCase}) :
        _subStepUseCase = subStepUseCase, super(SubStepInitial()) {
    on<GetSubStepsEvent>(_handleGetSubSteps);
  }

  Future<void> _handleGetSubSteps(GetSubStepsEvent event, Emitter<SubStepState> emit) async {
    emit(SubStepLoading());
    final result = await _subStepUseCase(event.stepID.toString());
    result.fold(
            (l) => emit(SubStepErrorState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
            (r) => emit(SubStepLoaded(r)));
  }
}

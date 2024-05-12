import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/usecases/check_exam_result_usecase.dart';

part 'check_sub_step_exam_result_event.dart';
part 'check_sub_step_exam_result_state.dart';

class CheckSubStepExamResultBloc extends Bloc<CheckSubStepExamResultEvent, CheckSubStepExamResultState> {
  final CheckExamResultUseCase _checkExamResultUseCase;
  CheckSubStepExamResultBloc({required CheckExamResultUseCase checkExamResultUseCase})
      : _checkExamResultUseCase = checkExamResultUseCase, super(CheckSubStepExamResultInitial()) {
    on<CheckExamResultEvent>(_handleCheckExamResultEvent);
  }

  Future<void> _handleCheckExamResultEvent(CheckExamResultEvent event, Emitter<CheckSubStepExamResultState> emit) async {
    emit(CheckResultLoading());
    final result = await _checkExamResultUseCase(event.params);
    result.fold(
            (l) => emit(CheckResultErrorState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
            (r) => emit(CheckResultLoaded(r)));
  }
}

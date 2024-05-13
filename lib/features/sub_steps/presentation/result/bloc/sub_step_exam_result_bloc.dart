import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/sub_step_exam_entity.dart';
import '../../../domain/usecases/get_sub_step_exams_usecase.dart';

part 'sub_step_exam_result_event.dart';
part 'sub_step_exam_result_state.dart';

class SubStepExamResultBloc extends Bloc<SubStepExamResultEvent, SubStepExamResultState> {
  final GetSubStepExamUseCase _getSubStepExamUseCase;
  SubStepExamResultBloc({required GetSubStepExamUseCase useCase}) : _getSubStepExamUseCase = useCase, super(SubStepExamResultInitial()) {
    on<SubStepExamResultEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> _handleGetResults(GetSubStepExamResultEvent event, Emitter<SubStepExamResultState> emit) async {
    emit(SubStepExamResultLoading());
    final result = await _getSubStepExamUseCase(event.params);

  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/sub_step_exam_entity.dart';
import '../../../domain/usecases/get_sub_step_exams_usecase.dart';

part 'sub_step_exam_event.dart';
part 'sub_step_exam_state.dart';

class SubStepExamBloc extends Bloc<SubStepExamEvent, SubStepExamState> {
  final GetSubStepExamUseCase _subStepExamUseCase;
  SubStepExamBloc({required GetSubStepExamUseCase useCase}) : _subStepExamUseCase = useCase, super(SubStepExamInitial()) {
    on<GetExamTestsEvent>(_handleGetSubStepExamTests);
  }

  Future<void> _handleGetSubStepExamTests(GetExamTestsEvent event, Emitter<SubStepExamState> emit) async {
    emit(SubStepExamLoading());
    final result = await _subStepExamUseCase(event.params);
    result.fold(
            (l) => emit(SubStepExamErrorState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
            (r) => emit(SubStepExamLoaded(r)));
  }
}

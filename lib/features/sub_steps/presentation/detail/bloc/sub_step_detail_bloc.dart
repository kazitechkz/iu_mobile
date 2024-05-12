import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/sub_step_entity.dart';
import '../../../domain/usecases/sub_step_detail_usecase.dart';

part 'sub_step_detail_event.dart';
part 'sub_step_detail_state.dart';

class SubStepDetailBloc extends Bloc<SubStepDetailEvent, SubStepDetailState> {
  bool _isClosed = false;

  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }

  void addEvent(SubStepDetailEvent event) {
    if (!_isClosed) {
      add(event);
    }
  }

  final SubStepDetailUseCase _subStepDetailUseCase;
  SubStepDetailBloc({required SubStepDetailUseCase subStepDetailUseCase}) : _subStepDetailUseCase = subStepDetailUseCase, super(SubStepDetailInitial()) {
    on<GetSubStepDetailEvent>(_handleGetSubStepDetail);
  }

  Future<void> _handleGetSubStepDetail(GetSubStepDetailEvent event, Emitter<SubStepDetailState> emit) async {
    emit(SubStepDetailLoading());
    final result = await _subStepDetailUseCase(event.subStepId.toString());
    result.fold(
            (l) => emit(SubStepDetailErrorState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
            (r) => emit(SubStepDetailLoaded(r)));
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../../stat/domain/entities/result_by_attempt_id_entity.dart';
import '../../../../stat/domain/use_cases/result_by_attempt_id_case.dart';
part 'attempt_result_event.dart';
part 'attempt_result_state.dart';

class AttemptResultBloc extends Bloc<AttemptResultEvent, AttemptResultState> {
  AttemptResultBloc({required ResultByAttemptIdCase resultByAttemptIdCase})
      : _resultByAttemptIdCase = resultByAttemptIdCase,
        super(AttemptResultInitialState()) {
    on<AttemptResultByAttemptIdEvent>(_handleAttemptResultByAttemptIdEvent);
  }
  final ResultByAttemptIdCase _resultByAttemptIdCase;

  Future<void> _handleAttemptResultByAttemptIdEvent(
      AttemptResultByAttemptIdEvent event,
      Emitter<AttemptResultState> emit) async {
    emit(AttemptResultLoadingState());
    final result = await _resultByAttemptIdCase(event.attemptId);
    result.fold(
        (l) => emit(AttemptResultFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(AttemptResultSuccessState(stats: r)));
  }
}

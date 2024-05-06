import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/stat_by_attempt_id_entity.dart';
import '../../../domain/use_cases/stat_by_attempt_id_case.dart';

part 'stat_attempt_event.dart';

part 'stat_attempt_state.dart';

class StatAttemptBloc extends Bloc<StatAttemptEvent, StatAttemptState> {
  StatAttemptBloc({required StatByAttemptIdCase statByAttemptIdCase})
      : _statByAttemptIdCase = statByAttemptIdCase,
        super(StatAttemptInitialState()) {
    on<StatGetByAttemptIdEvent>(_handlerStatGetByAttemptIdEvent);
  }

  StatByAttemptIdCase _statByAttemptIdCase;

  Future<void> _handlerStatGetByAttemptIdEvent(
      StatGetByAttemptIdEvent event, Emitter<StatAttemptState> emit) async {
    emit(StatAttemptLoadingState());
    final result = await _statByAttemptIdCase(event.attemptId);
    result.fold(
        (l) => emit(StatAttemptFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(StatAttemptSuccessState(stat: r)));
  }
}

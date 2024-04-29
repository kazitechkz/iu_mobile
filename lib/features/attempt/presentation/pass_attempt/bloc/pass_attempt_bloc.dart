import 'package:bloc/bloc.dart';
import 'package:iu/features/attempt/domain/use_cases/get_attempt_case.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_event.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_state.dart';
import '../../../../../core/common/models/failure_data.dart';

class PassAttemptBloc extends Bloc<PassAttemptEvent, PassAttemptState> {
  PassAttemptBloc({required GetAttemptCase attemptCase})
      : _attemptCase = attemptCase,
        super(PassAttemptInitialState()) {
    on<PassAttemptGetByAttemptIdEvent>(_handlePassAttemptGetByAttemptIdEvent);
  }
  final GetAttemptCase _attemptCase;

  Future<void> _handlePassAttemptGetByAttemptIdEvent(
      PassAttemptGetByAttemptIdEvent event,
      Emitter<PassAttemptState> emit) async {
    emit(PassAttemptLoadingState());
    final result = await _attemptCase(event.attemptId);
    result.fold(
        (l) => emit(PassAttemptFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(PassAttemptSuccessState(r)));
  }
}

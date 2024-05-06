import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/parameters/all_attempts_parameter.dart';
import 'package:iu/features/attempt/domain/use_cases/all_attempt_types_case.dart';
import 'package:iu/features/attempt/domain/use_cases/get_unt_stat_case.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/pagination_data.dart';
import '../../../../attempt/domain/entities/attempt_entity.dart';
import '../../../../attempt/domain/entities/unt_stat_entity.dart';
import '../../../../attempt/domain/use_cases/all_attempts_case.dart';

part 'stat_main_event.dart';
part 'stat_main_state.dart';

class StatMainBloc extends Bloc<StatMainEvent, StatMainState> {
  final GetUntStatCase _getUntStatCase;
  final AllAttemptsCase _allAttemptsCase;

  StatMainBloc(
      {required GetUntStatCase getUntStatCase,
      required AllAttemptsCase allAttemptsCase})
      : _getUntStatCase = getUntStatCase,
        _allAttemptsCase = allAttemptsCase,
        super(StatMainInitialState()) {
    on<StatMainGetUNTStatEvent>(_getUntStatHandler);
    on<StatMainAllAttemptsEvent>(_StatMainAllAttemptsHandler);
  }

  Future<void> _getUntStatHandler(
      StatMainGetUNTStatEvent event, Emitter<StatMainState> emit) async {
    emit(StatMainLoadingState());
    final result = await _getUntStatCase();
    result.fold(
        (l) => emit(StatMainFailedState(FailureData(
            statusCode: l.statusCode, message: l.message, errors: l.errors))),
        (r) => emit(StatMainSuccessState(untStatEntity: r)));
     add(StatMainAllAttemptsEvent(parameter: AllAttemptsParameter()));
  }

  Future<void> _StatMainAllAttemptsHandler(
      StatMainAllAttemptsEvent event, Emitter<StatMainState> emit) async {
    if (state is StatMainSuccessState) {
      final currentState = state as StatMainSuccessState;
      final result = await _allAttemptsCase(event.parameter);
      result.fold(
          (l) => emit(StatMainFailedState(FailureData(
              statusCode: l.statusCode, message: l.message, errors: l.errors))),
          (r) => emit(currentState.copyWith(allAttempts: r)));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/common/models/failure_data.dart';
import '../../../../domain/entities/get_subtournament_results_entity.dart';
import '../../../../domain/entities/sub_tournament_result_entity.dart';
import '../../../../domain/parameters/get_sub_tournament_results_parameter.dart';
import '../../../../domain/use_cases/get_sub_tournament_results_case.dart';

part 'sub_tournament_results_event.dart';
part 'sub_tournament_results_state.dart';

class SubTournamentResultsBloc
    extends Bloc<SubTournamentResultsEvent, SubTournamentResultsState> {
  SubTournamentResultsBloc(
      {required GetSubTournamentResultsCase getSubTournamentResultsCase})
      : _getSubTournamentResultsCase = getSubTournamentResultsCase,
        super(SubTournamentResultsInitialState()) {
    on<SubTournamentResultsBySubTournamentIdEvent>(
        _handleSubTournamentResultsBySubTournamentIdEvent);
  }

  final GetSubTournamentResultsCase _getSubTournamentResultsCase;

  Future<void> _handleSubTournamentResultsBySubTournamentIdEvent(
      SubTournamentResultsBySubTournamentIdEvent event,
      Emitter<SubTournamentResultsState> emit) async {
    final result = await _getSubTournamentResultsCase(event.parameter);

    if (state is SubTournamentResultsSuccessState) {
      final currentState = state as SubTournamentResultsSuccessState;
      final existingResult = currentState.results ?? [];
      emit(SubTournamentResultsLoadingState());
      result.fold(
          (l) => emit(
              SubTournamentResultsFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(
              resultsDataRemote: r,
              resultsRemote: [...existingResult, ...r.results.data])));
    } else {
      emit(SubTournamentResultsLoadingState());
      result.fold(
          (l) => emit(
              SubTournamentResultsFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(SubTournamentResultsSuccessState(
              resultsData: r, results: r.results.data)));
    }
  }
}

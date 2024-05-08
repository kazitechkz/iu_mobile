import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/common/models/failure_data.dart';
import '../../../../domain/entities/sub_tournament_rival_entity.dart';
import '../../../../domain/use_cases/get_sub_tournament_rivals_case.dart';
part 'sub_tournament_rivals_event.dart';
part 'sub_tournament_rivals_state.dart';

class SubTournamentRivalsBloc
    extends Bloc<SubTournamentRivalsEvent, SubTournamentRivalsState> {
  SubTournamentRivalsBloc(
      {required GetSubTournamentRivalsCase getSubTournamentRivalsCase})
      : _getSubTournamentRivalsCase = getSubTournamentRivalsCase,
        super(SubTournamentRivalsInitialState()) {
    on<SubTournamentRivalsGetByIdEvent>(_handleSubTournamentRivalsGetByIdEvent);
  }

  final GetSubTournamentRivalsCase _getSubTournamentRivalsCase;

  Future<void> _handleSubTournamentRivalsGetByIdEvent(
      SubTournamentRivalsGetByIdEvent event,
      Emitter<SubTournamentRivalsState> emit) async {
    emit(SubTournamentRivalsLoadingState());
    final result = await _getSubTournamentRivalsCase(event.subTournamentId);
    if (state is SubTournamentRivalsSuccessState) {
      final currentState = state as SubTournamentRivalsSuccessState;
      print(currentState.rivalsFinal);
      if (event.stepId == 2) {
        result.fold(
            (l) => emit(
                SubTournamentRivalsFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(currentState.copyWith(RivalsOneFour: r)));
      }
      if (event.stepId == 3) {
        result.fold(
            (l) => emit(
                SubTournamentRivalsFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(currentState.copyWith(RivalsOneTwo: r)));
      }
      if (event.stepId == 4) {
        result.fold(
            (l) => emit(
                SubTournamentRivalsFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(currentState.copyWith(RivalsFinal: r)));
      }
    } else {
      if (event.stepId == 2) {
        result.fold(
            (l) => emit(
                SubTournamentRivalsFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(SubTournamentRivalsSuccessState(rivalsOneFour: r)));
      }
      if (event.stepId == 3) {
        result.fold(
            (l) => emit(
                SubTournamentRivalsFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(SubTournamentRivalsSuccessState(rivalsOneTwo: r)));
      }
      if (event.stepId == 4) {
        result.fold(
            (l) => emit(
                SubTournamentRivalsFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(SubTournamentRivalsSuccessState(rivalsFinal: r)));
      }
    }
  }
}

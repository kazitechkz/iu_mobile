import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/common/models/failure_data.dart';
import '../../../../../../core/common/models/pagination_data.dart';
import '../../../../domain/entities/sub_tournament_participant_entity.dart';
import '../../../../domain/parameters/get_sub_tournament_participant_parameter.dart';
import '../../../../domain/use_cases/get_sub_tournament_participants_case.dart';

part 'sub_tournament_participants_event.dart';

part 'sub_tournament_participants_state.dart';

class SubTournamentParticipantsBloc extends Bloc<SubTournamentParticipantsEvent,
    SubTournamentParticipantsState> {
  SubTournamentParticipantsBloc(
      {required GetSubTournamentParticipantsCase
          getSubTournamentParticipantsCase})
      : this._getSubTournamentParticipantsCase =
            getSubTournamentParticipantsCase,
        super(SubTournamentParticipantsInitialState()) {
    on<SubTournamentGetParticipantsEvent>(
        _handleSubTournamentGetParticipantsEvent);
  }

  final GetSubTournamentParticipantsCase _getSubTournamentParticipantsCase;

  Future<void> _handleSubTournamentGetParticipantsEvent(
      SubTournamentGetParticipantsEvent event,
      Emitter<SubTournamentParticipantsState> emit) async {
    final result = await _getSubTournamentParticipantsCase(event.parameter);
    if (state is SubTournamentParticipantsSuccessState) {
      final currentState = state as SubTournamentParticipantsSuccessState;
      final existingParticipants = currentState.participants ?? [];
      emit(SubTournamentParticipantsLoadingState());
      result.fold(
          (l) => emit(SubTournamentParticipantsFailedState(
              FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(
              participantsData: r,
              participants: [...existingParticipants, ...r.data])));
    } else {
      emit(SubTournamentParticipantsLoadingState());
      result.fold(
          (l) => emit(SubTournamentParticipantsFailedState(
              FailureData.fromApiFailure(l))),
          (r) => emit(SubTournamentParticipantsSuccessState(
              participantsData: r, participants: r.data)));
    }
  }
}

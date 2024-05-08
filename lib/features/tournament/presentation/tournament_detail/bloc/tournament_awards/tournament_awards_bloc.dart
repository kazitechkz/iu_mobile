import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/common/models/pagination_data.dart';
import '../../../../domain/entities/tournament_award_entity.dart';
import '../../../../domain/parameters/get_tournament_awards_parameter.dart';
import '../../../../domain/use_cases/get_tournament_awards_case.dart';

part 'tournament_awards_event.dart';

part 'tournament_awards_state.dart';

class TournamentAwardsBloc
    extends Bloc<TournamentAwardsEvent, TournamentAwardsState> {
  TournamentAwardsBloc(
      {required GetTournamentAwardsCase getTournamentAwardsCase})
      : _getTournamentAwardsCase = getTournamentAwardsCase,
        super(TournamentAwardsInitialState()) {
    on<TournamentAwardByTournamentIdEvent>(
        _handleTournamentAwardByTournamentIdEvent);
  }

  final GetTournamentAwardsCase _getTournamentAwardsCase;

  Future<void> _handleTournamentAwardByTournamentIdEvent(
      TournamentAwardByTournamentIdEvent event,
      Emitter<TournamentAwardsState> emit) async {
    final result = await _getTournamentAwardsCase(event.params);

    if (state is TournamentAwardsSuccessState) {
      final currentState = state as TournamentAwardsSuccessState;
      final oldData = currentState.awards;
      result.fold(
          (l) =>
              emit(TournamentAwardsFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState
              .copyWith(AwardData: r, Awards: [...oldData, ...r.data])));
    } else {
      emit(TournamentAwardsLoadingState());
      result.fold(
          (l) =>
              emit(TournamentAwardsFailedState(FailureData.fromApiFailure(l))),
          (r) =>
              emit(TournamentAwardsSuccessState(awardData: r, awards: r.data)));
    }
  }
}

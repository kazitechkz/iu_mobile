import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/get_tournament_detail_entity.dart';
import '../../../domain/use_cases/get_tournament_detail_case.dart';

part 'tournament_detail_event.dart';
part 'tournament_detail_state.dart';

class TournamentDetailBloc
    extends Bloc<TournamentDetailEvent, TournamentDetailState> {
  TournamentDetailBloc({required GetTournamentDetailCase tournamentDetailCase})
      : this._getTournamentDetailCase = tournamentDetailCase,
        super(TournamentDetailInitialState()) {
    on<TournamentDetailGetActualEvent>(_handleTournamentDetailGetActualEvent);
  }
  final GetTournamentDetailCase _getTournamentDetailCase;

  Future<void> _handleTournamentDetailGetActualEvent(
      TournamentDetailGetActualEvent event,
      Emitter<TournamentDetailState> emit) async {
    print("wowwww");
    emit(TournamentDetailLoadingState());
    final result = await _getTournamentDetailCase(event.tournamentId);
    result.fold(
        (l) => emit(TournamentDetailFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(TournamentDetailSuccessState(r)));
  }
}

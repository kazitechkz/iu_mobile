import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/get_all_tournaments_entity.dart';
import '../../../domain/use_cases/get_all_tournament_case.dart';

part 'tournament_list_event.dart';
part 'tournament_list_state.dart';

class TournamentListBloc extends Bloc<TournamentListEvent, TournamentListState> {
  TournamentListBloc({required GetAllTournamentCase getAllTournamentCase})
      :
        _getAllTournamentCase = getAllTournamentCase,
        super(TournamentListInitialState()) {
        on<TournamentListGetActualEvent>(_handlerTournamentListGetActualEvent);
  }
  final GetAllTournamentCase _getAllTournamentCase;

  Future<void> _handlerTournamentListGetActualEvent(TournamentListGetActualEvent event, Emitter<TournamentListState> emit) async {
    emit(TournamentListLoadingState());
    final result = await _getAllTournamentCase();
    result.fold(
            (l) => emit(TournamentListFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(TournamentListSuccessState(r))
    );
  }

}

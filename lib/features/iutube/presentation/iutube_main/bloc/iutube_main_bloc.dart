import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/get_main_videos_entity.dart';
import '../../../domain/use_cases/get_main_videos_case.dart';

part 'iutube_main_event.dart';
part 'iutube_main_state.dart';

class IutubeMainBloc extends Bloc<IutubeMainEvent, IutubeMainState> {
  IutubeMainBloc({required GetMainVideosCase getMainVideosCase})
      : _getMainVideosCase = getMainVideosCase,
        super(IutubeMainInitialState()) {
    on<IutubeMainAllEvent>(_handleIutubeMainAllEvent);
  }
  final GetMainVideosCase _getMainVideosCase;

  Future<void> _handleIutubeMainAllEvent(
      IutubeMainAllEvent event, Emitter<IutubeMainState> emit) async {
    emit(IutubeMainLoadingState());
    final result = await _getMainVideosCase();
    result.fold(
        (l) => emit(IutubeMainFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(IutubeMainSuccessState(r)));
  }
}

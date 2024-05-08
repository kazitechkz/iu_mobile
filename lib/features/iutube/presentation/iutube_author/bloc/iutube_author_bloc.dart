import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/pagination_data.dart';
import '../../../domain/entities/iutube_author_entity.dart';
import '../../../domain/entities/iutube_video_entity.dart';
import '../../../domain/parameters/get_video_author_detail_parameter.dart';
import '../../../domain/use_cases/get_video_author_case.dart';
part 'iutube_author_event.dart';
part 'iutube_author_state.dart';

class IutubeAuthorBloc extends Bloc<IutubeAuthorEvent, IutubeAuthorState> {
  IutubeAuthorBloc({required GetVideoAuthorCase getVideoAuthorCase})
      : _getVideoAuthorCase = getVideoAuthorCase,
        super(IutubeAuthorInitialState()) {
    on<IutubeAuthorByIdEvent>(_handleIutubeAuthorByIdEvent);
  }
  final GetVideoAuthorCase _getVideoAuthorCase;

  Future<void> _handleIutubeAuthorByIdEvent(
      IutubeAuthorByIdEvent event, Emitter<IutubeAuthorState> state) async {
    final result = await _getVideoAuthorCase(event.parameter);
    if (state is IutubeAuthorSuccessState) {
      final currentState = state as IutubeAuthorSuccessState;
      final oldVideos = currentState.videos;
      result.fold(
          (l) => IutubeAuthorFailedState(FailureData.fromApiFailure(l)),
          (r) =>
              emit(currentState.copyWith(Author: r.author, Videos: r.videos)));
    } else {
      emit(IutubeAuthorLoadingState());
      result.fold(
          (l) => IutubeAuthorFailedState(FailureData.fromApiFailure(l)),
          (r) => emit(
              IutubeAuthorSuccessState(author: r.author, videos: r.videos)));
    }
  }
}

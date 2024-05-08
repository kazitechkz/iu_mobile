import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/pagination_data.dart';
import '../../../domain/entities/iutube_video_entity.dart';
import '../../../domain/parameters/get_all_videos_parameter.dart';
import '../../../domain/use_cases/get_all_videos_case.dart';

part 'iutube_list_event.dart';

part 'iutube_list_state.dart';

class IutubeListBloc extends Bloc<IutubeListEvent, IutubeListState> {
  IutubeListBloc({required GetAllVideosCase getAllVideosCase})
      : _getAllVideosCase = getAllVideosCase,
        super(IutubeListInitialState()) {
    on<IutubeListAllEvent>(_handleIutubeListAllEvent);
  }

  final GetAllVideosCase _getAllVideosCase;

  Future<void> _handleIutubeListAllEvent(
      IutubeListAllEvent event, Emitter<IutubeListState> emit) async {
    final result = await _getAllVideosCase(event.parameter);
    if (state is IutubeListSuccessState) {
      final currentState = state as IutubeListSuccessState;
      final oldVideos = currentState.videos;
      result.fold(
          (l) => IutubeListFailedState(FailureData.fromApiFailure(l)),
          (r) => emit(currentState
              .copyWith(VideoData: r, Videos: [...oldVideos, ...r.data])));
    } else {
      emit(IutubeListLoadingState());
      result.fold((l) => IutubeListFailedState(FailureData.fromApiFailure(l)),
          (r) => emit(IutubeListSuccessState(videoData: r, videos: r.data)));
    }
  }
}

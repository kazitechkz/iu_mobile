part of 'iutube_list_bloc.dart';

@immutable
sealed class IutubeListState extends Equatable {}

final class IutubeListInitialState extends IutubeListState {
  @override
  List<Object?> get props => [];
}

final class IutubeListLoadingState extends IutubeListState {
  @override
  List<Object?> get props => [];
}

final class IutubeListFailedState extends IutubeListState {
  final FailureData failureData;
  IutubeListFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class IutubeListSuccessState extends IutubeListState {
  final PaginationData<List<IUTubeVideoEntity>> videoData;
  final List<IUTubeVideoEntity> videos;
  IutubeListSuccessState({required this.videoData, required this.videos});

  IutubeListSuccessState copyWith(
      {PaginationData<List<IUTubeVideoEntity>>? VideoData,
      List<IUTubeVideoEntity>? Videos}) {
    return IutubeListSuccessState(
      videoData: VideoData ?? videoData,
      videos: Videos ?? videos,
    );
  }

  @override
  List<Object?> get props => [videoData, videos];
}

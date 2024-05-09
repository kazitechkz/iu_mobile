part of 'iutube_author_bloc.dart';

@immutable
sealed class IutubeAuthorState extends Equatable {}

final class IutubeAuthorInitialState extends IutubeAuthorState {
  @override
  List<Object?> get props => [];
}

final class IutubeAuthorLoadingState extends IutubeAuthorState {
  @override
  List<Object?> get props => [];
}

final class IutubeAuthorFailedState extends IutubeAuthorState {
  final FailureData failureData;

  IutubeAuthorFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData];
}

final class IutubeAuthorSuccessState extends IutubeAuthorState {
  final IUTubeAuthorEntity author;
  final PaginationData<List<IUTubeVideoEntity>> videos;

  IutubeAuthorSuccessState({required this.videos, required this.author});

  IutubeAuthorSuccessState copyWith({
    final IUTubeAuthorEntity? Author,
    final PaginationData<List<IUTubeVideoEntity>>? Videos,
  }) {
    return IutubeAuthorSuccessState(
      author: Author ?? author,
      videos: Videos ?? videos,
    );
  }

  @override
  List<Object?> get props => [videos, author];
}

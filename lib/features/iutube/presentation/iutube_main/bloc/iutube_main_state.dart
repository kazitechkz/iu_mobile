part of 'iutube_main_bloc.dart';

@immutable
sealed class IutubeMainState extends Equatable {}

final class IutubeMainInitialState extends IutubeMainState {
  @override
  List<Object?> get props => [];
}

final class IutubeMainLoadingState extends IutubeMainState {
  @override
  List<Object?> get props => [];
}

final class IutubeMainFailedState extends IutubeMainState {
  final FailureData failureData;
  IutubeMainFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class IutubeMainSuccessState extends IutubeMainState {
  final GetMainVideosEntity getMainVideosEntity;
  IutubeMainSuccessState(this.getMainVideosEntity);
  @override
  List<Object?> get props => [getMainVideosEntity];
}

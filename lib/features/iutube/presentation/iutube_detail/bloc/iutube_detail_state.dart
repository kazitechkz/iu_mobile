part of 'iutube_detail_bloc.dart';

@immutable
sealed class IutubeDetailState extends Equatable {}

final class IutubeDetailInitialState extends IutubeDetailState {
  @override
  List<Object?> get props => [];
}

final class IutubeDetailLoadingState extends IutubeDetailState {
  @override
  List<Object?> get props => [];
}

final class IutubeDetailFailedState extends IutubeDetailState {
  final FailureData failureData;
  IutubeDetailFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class IutubeDetailSuccessState extends IutubeDetailState {
  final GetVideoDetailEntity getVideoDetailEntity;
  IutubeDetailSuccessState(this.getVideoDetailEntity);
  @override
  List<Object?> get props => [getVideoDetailEntity];
}

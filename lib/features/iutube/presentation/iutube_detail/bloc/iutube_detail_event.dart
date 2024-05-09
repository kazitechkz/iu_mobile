part of 'iutube_detail_bloc.dart';

@immutable
sealed class IutubeDetailEvent {}

class IutubeDetailByAliasEvent extends IutubeDetailEvent {
  final GetVideoDetailParameter parameter;
  IutubeDetailByAliasEvent(this.parameter);
}

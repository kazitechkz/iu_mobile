part of 'iutube_author_bloc.dart';

@immutable
sealed class IutubeAuthorEvent {}

class IutubeAuthorByIdEvent extends IutubeAuthorEvent {
  final GetVideoAuthorDetailParameter parameter;
  IutubeAuthorByIdEvent(this.parameter);
}

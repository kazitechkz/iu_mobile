part of 'iutube_list_bloc.dart';

@immutable
sealed class IutubeListEvent {}

class IutubeListAllEvent extends IutubeListEvent {
  final GetAllVideosParameter parameter;
  IutubeListAllEvent(this.parameter);
}

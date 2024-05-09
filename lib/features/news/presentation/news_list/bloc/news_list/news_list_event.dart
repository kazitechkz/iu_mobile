part of 'news_list_bloc.dart';

@immutable
sealed class NewsListEvent {}

class NewsListGetEvent extends NewsListEvent {
  final AllNewsParameter parameter;
  NewsListGetEvent(this.parameter);
}

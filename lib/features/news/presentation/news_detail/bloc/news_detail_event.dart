part of 'news_detail_bloc.dart';

@immutable
abstract class NewsDetailEvent {}

class NewsDetailByAliasEvent extends NewsDetailEvent{
  final String alias;
  NewsDetailByAliasEvent(this.alias);
}

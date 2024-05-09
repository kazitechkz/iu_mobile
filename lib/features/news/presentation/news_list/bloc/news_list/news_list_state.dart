part of 'news_list_bloc.dart';

@immutable
sealed class NewsListState extends Equatable {}

final class NewsListInitialState extends NewsListState {
  @override
  List<Object?> get props => [];
}

final class NewsListLoadingState extends NewsListState {
  @override
  List<Object?> get props => [];
}

final class NewsListFailedState extends NewsListState {
  final FailureData failureData;
  NewsListFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class NewsListSuccessState extends NewsListState {
  final PaginationData<List<NewsEntity>> newsData;
  final List<NewsEntity> news;
  NewsListSuccessState({required this.newsData, required this.news});

  NewsListSuccessState copyWith({
    PaginationData<List<NewsEntity>>? NewsData,
    List<NewsEntity>? News,
  }) {
    return NewsListSuccessState(
        news: News ?? news, newsData: NewsData ?? newsData);
  }

  @override
  List<Object?> get props => [newsData, news];
}

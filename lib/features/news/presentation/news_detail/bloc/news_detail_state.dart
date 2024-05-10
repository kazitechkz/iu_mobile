part of 'news_detail_bloc.dart';

@immutable
abstract class NewsDetailState extends Equatable {}

class NewsDetailInitialState  extends NewsDetailState {
  @override
  List<Object?> get props => [];
}

class NewsDetailLoadingState  extends NewsDetailState {
  @override
  List<Object?> get props => [];
}

class NewsDetailFailedState  extends NewsDetailState {
  final FailureData failureData;
  NewsDetailFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

class NewsDetailSuccessState  extends NewsDetailState {
  final NewsEntity newsEntity;
  NewsDetailSuccessState(this.newsEntity);
  @override
  List<Object?> get props => [newsEntity];
}
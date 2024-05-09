part of 'important_news_bloc.dart';

@immutable
sealed class ImportantNewsState extends Equatable {}

final class ImportantNewsInitialState extends ImportantNewsState {
  @override
  List<Object?> get props => [];
}

final class ImportantNewsLoadingState extends ImportantNewsState {
  @override
  List<Object?> get props => [];
}

final class ImportantNewsFailedState extends ImportantNewsState {
  final FailureData failureData;
  ImportantNewsFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class ImportantNewsSuccessState extends ImportantNewsState {
  final NewsEntity importantNews;
  ImportantNewsSuccessState(this.importantNews);
  @override
  List<Object?> get props => [importantNews];
}

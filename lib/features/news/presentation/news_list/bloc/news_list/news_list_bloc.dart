import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/common/models/failure_data.dart';
import '../../../../../../core/common/models/pagination_data.dart';
import '../../../../domain/entities/news_entity.dart';
import '../../../../domain/parameters/all_news_parameter.dart';
import '../../../../domain/use_cases/all_news_case.dart';

part 'news_list_event.dart';

part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc({required AllNewsCase allNewsCase})
      : _allNewsCase = allNewsCase,
        super(NewsListInitialState()) {
    on<NewsListGetEvent>(_handleNewsListGetEvent);
  }
  final AllNewsCase _allNewsCase;

  Future<void> _handleNewsListGetEvent(
      NewsListGetEvent event, Emitter<NewsListState> state) async {
    final result = await _allNewsCase(event.parameter);
    if (state is NewsListSuccessState) {
      final currentState = state as NewsListSuccessState;
      final oldNews = currentState.news;
      emit(NewsListLoadingState());
      result.fold(
          (l) => emit(NewsListFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState
              .copyWith(NewsData: r, News: [...oldNews, ...r.data])));
    } else {
      emit(NewsListLoadingState());
      result.fold(
          (l) => emit(NewsListFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(NewsListSuccessState(newsData: r, news: r.data)));
    }
  }
}

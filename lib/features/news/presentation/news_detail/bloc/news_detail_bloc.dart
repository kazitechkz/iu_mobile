import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../domain/use_cases/get_single_news_case.dart';

part 'news_detail_event.dart';

part 'news_detail_state.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  NewsDetailBloc({required GetSingleNewsCase getSingleNewsCase})
      : this._getSingleNewsCase = getSingleNewsCase,
        super(NewsDetailInitialState()) {
    on<NewsDetailByAliasEvent>(_handleNewsDetailByAliasEvent);
  }
  final GetSingleNewsCase _getSingleNewsCase;

  Future<void> _handleNewsDetailByAliasEvent(NewsDetailByAliasEvent event, Emitter<NewsDetailState> emit) async {
    (NewsDetailLoadingState());
    final result = await _getSingleNewsCase(event.alias);
    result.fold(
            (l) => emit(NewsDetailFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(NewsDetailSuccessState(r)));
  }

}

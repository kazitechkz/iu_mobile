import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/discuss_entity.dart';
import '../../../domain/entities/get_forum_discuss_entity.dart';
import '../../../domain/entities/get_forum_entity.dart';
import '../../../domain/parameters/get_forum_discuss_parameter.dart';
import '../../../domain/use_cases/get_forum_case.dart';
import '../../../domain/use_cases/get_forum_discuss_case.dart';

part 'forum_detail_event.dart';

part 'forum_detail_state.dart';

class ForumDetailBloc extends Bloc<ForumDetailEvent, ForumDetailState> {
  ForumDetailBloc({
    required GetForumCase getForumCase,
    required GetForumDiscussCase getForumDiscussCase
  })
      :
        this._getForumDiscussCase = getForumDiscussCase,
        this._getForumCase = getForumCase,
        super(ForumDetailInitialState()) {
    on<ForumDetailGetByIdEvent>(_handleForumDetailGetByIdEvent);
    on<ForumDetailGetDiscussesEvent>(_handleForumDetailGetDiscussesEvent);
  }

  final GetForumCase _getForumCase;
  final GetForumDiscussCase _getForumDiscussCase;

  Future<void> _handleForumDetailGetByIdEvent(ForumDetailGetByIdEvent event,
      Emitter<ForumDetailState> emit) async {
    emit(ForumDetailLoadingState());
    final result = await _getForumCase(event.forumId);
    result.fold(
            (l) => emit(ForumDetailFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(ForumDetailSuccessState(forumEntity: r))
    );

  }

  Future<void> _handleForumDetailGetDiscussesEvent(ForumDetailGetDiscussesEvent event,
      Emitter<ForumDetailState> emit) async {
    if (state is ForumDetailSuccessState) {
      final currentState = state as ForumDetailSuccessState;
      final discussesOld = currentState.discusses;
      final result = await _getForumDiscussCase(event.parameter);
      result.fold(
              (l) =>
              emit(ForumDetailFailedState(FailureData.fromApiFailure(l))),
              (r) =>emit(currentState.copyWith(Discusses: [...?discussesOld,...r.discusses.data ])));
    }
  }

}

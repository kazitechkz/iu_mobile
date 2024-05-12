import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/pagination_data.dart';
import '../../../domain/entities/forum_entity.dart';
import '../../../domain/parameters/all_forum_parameter.dart';
import '../../../domain/use_cases/all_forum_case.dart';

part 'all_forum_event.dart';

part 'all_forum_state.dart';

class AllForumBloc extends Bloc<AllForumEvent, AllForumState> {
  AllForumBloc({required AllForumCase allForumCase})
      : _allForumCase = allForumCase,
        super(AllForumInitialState()) {
    on<AllForumWithParamsEvent>(_handleAllForumWithParamsEvent);
  }

  final AllForumCase _allForumCase;

  Future<void> _handleAllForumWithParamsEvent(
      AllForumWithParamsEvent event, Emitter<AllForumState> emit) async {
    emit(AllForumLoadingState());
    final result = await _allForumCase(event.parameter);
    result.fold((l) => emit(AllForumFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(AllForumSuccessState(forumData: r, forums: r.data)));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';

import '../../domain/usecases/cache_visited.dart';
import '../../domain/usecases/check_is_first_time.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc({required CacheVisitedCase cacheVisitedCase,required CheckIsFirstTimeCase checkIsFirstTimeCase})
      :
      _cacheVisitedCase = cacheVisitedCase,
      _checkIsFirstTimeCase = checkIsFirstTimeCase,
        super(WelcomeInitialState()) {
    on<WelcomeEvent>((event, emit) {

    });
  }

  final CacheVisitedCase _cacheVisitedCase;
  final CheckIsFirstTimeCase _checkIsFirstTimeCase;

  Future<void> _cacheVisitedHandler(WelcomeCacheEvent event, Emitter<WelcomeState> emit)async {
    emit(WelcomeLoadingState());
    final result = await _cacheVisitedCase();
    result.fold(
            (failure) => emit(WelcomeFailedState(FailureData(message: failure.message, statusCode: failure.statusCode,errors: failure.errors))), 
            (success) => emit(WelcomeCachedState()));
  }

  Future<void> _checkIsFirstTimeHandler(CheckIsFirstTimeCase event, Emitter<WelcomeState> emit)async {
    emit(WelcomeLoadingState());
    final result = await _checkIsFirstTimeCase();
    result.fold(
            (failure) => emit(WelcomeFailedState(FailureData(message: failure.message, statusCode: failure.statusCode,errors: failure.errors))),
            (success) => emit(WelcomeCheckedState(success)));
  }

}

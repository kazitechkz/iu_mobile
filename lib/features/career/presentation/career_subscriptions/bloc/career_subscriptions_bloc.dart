import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/get_career_quiz_group_list_entity.dart';
import '../../../domain/use_cases/get_career_quiz_group_list_case.dart';

part 'career_subscriptions_event.dart';

part 'career_subscriptions_state.dart';

class CareerSubscriptionsBloc
    extends Bloc<CareerSubscriptionsEvent, CareerSubscriptionsState> {
  CareerSubscriptionsBloc(
      {required GetCareerQuizGroupListCase getCareerQuizGroupListCase})
      : _getCareerQuizGroupListCase = getCareerQuizGroupListCase,
        super(CareerSubscriptionsInitialState()) {
    on<GetCareerQuizGroupListEvent>(_handleGetCareerQuizGroupListEvent);
  }

  final GetCareerQuizGroupListCase _getCareerQuizGroupListCase;

  Future<void> _handleGetCareerQuizGroupListEvent(
      GetCareerQuizGroupListEvent event,
      Emitter<CareerSubscriptionsState> emit) async {
    emit(CareerSubscriptionsLoadingState());
    final result = await _getCareerQuizGroupListCase();
    result.fold(
        (l) =>
            emit(CareerSubscriptionsFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(
            CareerSubscriptionsSuccessState(careerQuizGroupListEntity: r)));
  }
}

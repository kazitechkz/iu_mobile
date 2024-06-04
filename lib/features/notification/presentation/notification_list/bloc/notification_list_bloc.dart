import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/pagination_data.dart';
import '../../../domain/entities/notification_entity.dart';
import '../../../domain/parameters/get_notification_all_parameter.dart';
import '../../../domain/use_cases/check_notification_case.dart';
import '../../../domain/use_cases/get_notification_all_case.dart';
import '../../../domain/use_cases/my_notification_ids_case.dart';

part 'notification_list_event.dart';
part 'notification_list_state.dart';

class NotificationListBloc extends Bloc<NotificationListEvent, NotificationListState> {
  NotificationListBloc(
  {required GetNotificationAllCase getNotificationAllCase,
    required MyNotificationIdsCase myNotificationIdsCase,
    required CheckNotificationCase checkNotificationCase
  }) :
      this._getNotificationAllCase = getNotificationAllCase,
      this._myNotificationIdsCase = myNotificationIdsCase,
      this._checkNotificationCase = checkNotificationCase,
        super(NotificationListInitialState()) {
      on<NotificationListGetAllEvent>(_handleNotificationListGetAllEvent);
      on<NotificationListGetMyIdsEvent>(_handleNotificationListGetMyIdsEvent);
  }

  final GetNotificationAllCase _getNotificationAllCase;
  final MyNotificationIdsCase _myNotificationIdsCase;
  final CheckNotificationCase _checkNotificationCase;

  Future<void> _handleNotificationListGetAllEvent(NotificationListGetAllEvent event, Emitter<NotificationListState> emit) async {
    emit(NotificationListLoadingState());
    final result = await _getNotificationAllCase(event.parameter);
    result.fold(
            (l) => emit(NotificationListFailedState(failureData: FailureData.fromApiFailure(l))),
            (r) => emit(NotificationListSuccessState(notificationEntity: r, notifications: r.data))
    );
  }

  Future<void> _handleNotificationListGetMyIdsEvent(NotificationListGetMyIdsEvent event, Emitter<NotificationListState> emit)async{
    if(state is NotificationListSuccessState){
      final currentState = state as NotificationListSuccessState;
      final result = await _myNotificationIdsCase();
      result.fold(
              (l) => emit(NotificationListFailedState(failureData: FailureData.fromApiFailure(l))),
      (r) => emit(currentState.copyWith(NotificationIDS: r))
      );
    }
  }

}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:iu/features/classroom/domain/parameters/room_parameters.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/classroom_entity.dart';
import '../../domain/use_cases/exit_room_case.dart';
import '../../domain/use_cases/get_rooms_case.dart';
import '../../domain/use_cases/join_room_case.dart';

part 'classroom_event.dart';
part 'classroom_state.dart';

class ClassroomBloc extends Bloc<ClassroomEvent, ClassroomState> {
  ClassroomBloc({
    required ExitRoomCase exitRoomCase,
    required GetRoomsCase getRoomsCase,
    required JoinRoomCase joinRoomCase,
})
      :
      this._joinRoomCase = joinRoomCase,
      this._getRoomsCase = getRoomsCase,
      this._exitRoomCase = exitRoomCase,
        super(ClassroomInitialState()) {
      on<ClassroomAllEvent>(_handleClassroomAllEvent);
      on<ClassroomJoinEvent>(_handleClassroomJoinEvent);
      on<ClassroomExitEvent>(_handleClassroomExitEvent);
  }

  final ExitRoomCase _exitRoomCase;
  final GetRoomsCase _getRoomsCase;
  final JoinRoomCase _joinRoomCase;

  Future<void> _handleClassroomAllEvent(ClassroomAllEvent event, Emitter<ClassroomState> emit) async {
    emit(ClassroomLoadingState());
    final result = await _getRoomsCase();
    result.fold(
            (l) => emit(ClassroomFailedState(FailureData.fromApiFailure(l))),
            (r) => emit(ClassroomSuccessState(r))
    );
  }

  Future<void> _handleClassroomJoinEvent(ClassroomJoinEvent event, Emitter<ClassroomState> emit) async {
    emit(ClassroomLoadingState());
    final result = await _joinRoomCase(event.parameter);
    result.fold(
            (l) => emit(ClassroomFailedState(FailureData.fromApiFailure(l))),
            (r) => add(ClassroomAllEvent())
    );
  }
  Future<void> _handleClassroomExitEvent(ClassroomExitEvent event, Emitter<ClassroomState> emit) async {
    emit(ClassroomLoadingState());
    final result = await _exitRoomCase(event.roomId);
    result.fold(
            (l) => emit(ClassroomFailedState(FailureData.fromApiFailure(l))),
            (r) => add(ClassroomAllEvent())
    );
  }

}

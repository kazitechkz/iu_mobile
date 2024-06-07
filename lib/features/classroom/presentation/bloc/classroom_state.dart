part of 'classroom_bloc.dart';

@immutable
abstract class ClassroomState extends Equatable {}

class ClassroomInitialState extends ClassroomState {
  @override
  List<Object?> get props => [];
}

class ClassroomLoadingState extends ClassroomState {
  @override
  List<Object?> get props => [];
}

class ClassroomFailedState extends ClassroomState {
  final FailureData failureData;
  ClassroomFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

class ClassroomSuccessState extends ClassroomState {
  final List<ClassRoomEntity> rooms;
  ClassroomSuccessState(this.rooms);
  @override
  List<Object?> get props => [rooms];
}
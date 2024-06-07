part of 'classroom_bloc.dart';

@immutable
abstract class ClassroomEvent {}

class ClassroomAllEvent extends ClassroomEvent{}
class ClassroomJoinEvent extends ClassroomEvent{
  final RoomParameter parameter;
  ClassroomJoinEvent(this.parameter);
}

class ClassroomExitEvent extends ClassroomEvent{
  final int roomId;
  ClassroomExitEvent(this.roomId);
}
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/classroom/domain/entities/classroom_entity.dart';
import 'package:iu/features/classroom/domain/parameters/room_parameters.dart';

abstract class ClassRoomInterface {
  ResultFuture<List<ClassRoomEntity>> getRooms();
  ResultFuture<bool> joinRoom(RoomParameter parameter);
  ResultFuture<bool> exitRoom(int roomId);
}
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/classroom/domain/parameters/room_parameters.dart';

import '../interface/classroom_interface.dart';

class JoinRoomCase extends UseCaseWithParams<bool, RoomParameter>{
  final ClassRoomInterface _classRoomInterface;
  const JoinRoomCase(this._classRoomInterface);

  @override
  ResultFuture<bool> call(RoomParameter params) {
    return _classRoomInterface.joinRoom(params);
  }
}

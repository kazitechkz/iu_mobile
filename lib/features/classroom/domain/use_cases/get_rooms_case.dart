import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/classroom/domain/interface/classroom_interface.dart';

import '../entities/classroom_entity.dart';

class GetRoomsCase extends UseCaseWithoutParams<List<ClassRoomEntity>>{
  final ClassRoomInterface _classRoomInterface;
  const GetRoomsCase(this._classRoomInterface);

  @override
  ResultFuture<List<ClassRoomEntity>> call() async {
    return await _classRoomInterface.getRooms();
  }



}
import '../../../../core/usecases/use_case.dart';
import '../../../../core/utils/typedef.dart';
import '../interface/classroom_interface.dart';

class ExitRoomCase extends UseCaseWithParams<bool, int>{
  final ClassRoomInterface _classRoomInterface;
  const ExitRoomCase(this._classRoomInterface);

  @override
  ResultFuture<bool> call(int params) {
    return _classRoomInterface.exitRoom(params);
  }
}
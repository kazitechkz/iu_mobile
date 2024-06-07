import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/classroom/data/datasources/classroom_datasource.dart';
import 'package:iu/features/classroom/domain/entities/classroom_entity.dart';
import 'package:iu/features/classroom/domain/interface/classroom_interface.dart';
import 'package:iu/features/classroom/domain/parameters/room_parameters.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class ClassRoomRepository extends ClassRoomInterface{
  final ClassRoomDataSourceInterface _classRoomDataSourceInterface;
  ClassRoomRepository( this._classRoomDataSourceInterface);

  @override
  ResultFuture<bool> exitRoom(int roomId) async {
    try {
      final result = await _classRoomDataSourceInterface.exitRoom(roomId);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<List<ClassRoomEntity>> getRooms() async {
    try {
      final result = await _classRoomDataSourceInterface.getRooms();
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<bool> joinRoom(RoomParameter parameter) async {
    try {
      final result = await _classRoomDataSourceInterface.joinRoom(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

}
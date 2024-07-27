import 'package:dio/dio.dart';
import 'package:iu/features/classroom/data/models/classroom_model.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/classroom_entity.dart';
import '../../domain/parameters/room_parameters.dart';

abstract class ClassRoomDataSourceInterface {
  Future<List<ClassRoomEntity>> getRooms();
  Future<bool> joinRoom(RoomParameter parameter);
  Future<bool> exitRoom(int roomId);
}

class ClassRoomDataSourceImpl implements ClassRoomDataSourceInterface{
  final httpUtils = HttpUtil();
  @override
  Future<bool> exitRoom(int roomId) async {
    try {
      final response = await httpUtils.delete("${ApiConstant.studentClassRooms}/$roomId");
      final responseData = ResponseData.fromJson(response);
      bool data = responseData.data;
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<ClassRoomEntity>> getRooms() async {
    try {
      final response = await httpUtils.get(ApiConstant.studentClassRooms);
      final responseData = ResponseData.fromJson(response);
      List<ClassRoomEntity> data = ClassRoomModel.fromMapList(responseData.data.cast<Map<String, dynamic>>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> joinRoom(RoomParameter parameter) async {
    try {
      final response = await httpUtils.post(ApiConstant.studentClassRooms,data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      bool data = responseData.data;
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
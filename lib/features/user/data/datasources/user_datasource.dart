import 'package:dio/dio.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/ordinary_user.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/injection_main.container.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/me_entity.dart';
import '../../domain/parameters/change_profile_parameters.dart';
import '../../domain/parameters/find_user_by_email_parameter.dart';
import '../models/me_model.dart';

abstract class UserDataSourceInterface{
  Future<MeEntity> accountDS();
  Future<bool> accountChangeDS(ChangeProfileParameter parameter);
  Future<OrdinaryUserEntity> findUserByEmailDS(FindUserByEmailParameter parameter);
  Future<bool> changeAva(ChangeAvatarParameter parameter);
}

class UserDataSourceImpl implements UserDataSourceInterface{
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<MeEntity> accountDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.me);
      final responseData = ResponseData.fromJson(response);
      final result = MeModel.fromJson(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> accountChangeDS(ChangeProfileParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.updateMe,data:parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = responseData.data as bool;
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      sl<Talker>().debug(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<OrdinaryUserEntity> findUserByEmailDS(FindUserByEmailParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.findUserByEmail,data:parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = OrdinaryUserModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> changeAva(ChangeAvatarParameter parameter) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(parameter.path),
      });
      final response = await HttpUtil().post(ApiConstant.changeAva, data: formData);
      final responseData = ResponseData.fromJson(response);
      sl<Talker>().debug(formData);
      return responseData.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
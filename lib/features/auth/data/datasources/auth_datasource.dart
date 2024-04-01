import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/app_constants/hive_constant.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/errors/exception.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/auth/domain/parameters/reset_parameter.dart';

import '../../../../core/interceptors/bearer_interceptor.dart';
import '../../../../core/services/injection_main.container.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../../domain/parameters/forget_parameter.dart';
import '../../domain/parameters/sign_in_parameter.dart';
import '../../domain/parameters/sign_up_parameter.dart';
import '../../domain/parameters/verify_parameter.dart';
import '../models/auth_info_model.dart';

abstract class AuthDataSourceInterface {
  Future<AuthUserEntity> signInDS(SignInParameter parameter);
  Future<String> signUpDS(SignUpParameter parameter);
  Future<bool> forgetDS(ForgetParameter parameter);
  Future<bool> verifyDS(VerifyParameter parameter);
  Future<bool> sendResetTokenDS(SendResetTokenParameter parameter);
}

class AuthDataSourceImpl extends AuthDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<bool> forgetDS(ForgetParameter parameter) async {
    try {
      final result = await httpUtils.post(ApiConstant.backResetPassword,
          queryParameters: parameter.toMap());
      ResponseData<bool> data = ResponseData<bool>.fromJson(result);
      return data.data ?? false;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<AuthUserEntity> signInDS(SignInParameter parameter) async {
    try {
      final result = await httpUtils.post(ApiConstant.backApiLogin,
          queryParameters: parameter.toMap());
      final data = AuthInfoModel.fromMap(result["data"]);
      sl<Dio>().interceptors.add(BearerTokenInterceptor(data.token));
      await hiveUtils.setString(HiveConstant.tokenKey, data.token);
      await hiveUtils.setLocalUser(data.user);
      return data.user;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<String> signUpDS(SignUpParameter parameter) async {
    try {
      final result = await httpUtils.post(ApiConstant.backApiRegister,
          queryParameters: parameter.toMap());
      ResponseData<String> data = ResponseData<String>.fromJson(result);
      return data.data as String;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> verifyDS(VerifyParameter parameter) async {
    try {
      final result = await httpUtils.post(ApiConstant.backVerifyEmail,
          queryParameters: parameter.toMap());
      ResponseData<bool> data = ResponseData<bool>.fromJson(result);
      return data.data ?? false;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> sendResetTokenDS(SendResetTokenParameter parameter) async {
    try {
      final result = await httpUtils.post(ApiConstant.backResetToken,
          queryParameters: parameter.toMap());
      ResponseData<bool> data = ResponseData<bool>.fromJson(result);
      return data.data ?? false;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

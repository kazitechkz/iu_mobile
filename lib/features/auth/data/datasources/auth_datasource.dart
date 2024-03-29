import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/errors/exception.dart';
import 'package:iu/core/utils/http_utils.dart';

import '../../domain/entities/auth_user_entity.dart';
import '../../domain/parameters/forget_parameter.dart';
import '../../domain/parameters/sign_in_parameter.dart';
import '../../domain/parameters/sign_up_parameter.dart';
import '../../domain/parameters/verify_parameter.dart';

abstract class AuthDataSourceInterface{
  Future<AuthUserEntity> signInDS(SignInParameter parameter);
  Future<String> signUpDS(SignUpParameter parameter);
  Future<bool> forgetDS(ForgetParameter parameter);
  Future<bool> verifyDS(VerifyParameter parameter);
}

class AuthDataSourceImpl extends AuthDataSourceInterface{

  final httpUtils = HttpUtil();


  @override
  Future<bool> forgetDS(ForgetParameter parameter)async {
    try{
      final result = await httpUtils.post(ApiConstant.backResetToken,queryParameters: parameter.toMap());
      ResponseData<bool> data = ResponseData<bool>.fromJson(result);
      return data.data??false;
    }
    on Exception catch(e){
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<AuthUserEntity> signInDS(SignInParameter parameter)async {
    try{
      final result = await httpUtils.post(ApiConstant.backApiLogin,queryParameters: parameter.toMap());
      ResponseData<AuthUserEntity> data = ResponseData<AuthUserEntity>.fromJson(result);
      return data.data as AuthUserEntity;
    }
    on Exception catch(e){
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<String> signUpDS(SignUpParameter parameter)async {
    try{
      final result = await httpUtils.post(ApiConstant.backApiRegister,queryParameters: parameter.toMap());
      ResponseData<String> data = ResponseData<String>.fromJson(result);
      return data.data as String;
    }
    on Exception catch(e){
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> verifyDS(VerifyParameter parameter)async {
    try{
      final result = await httpUtils.post(ApiConstant.backVerifyEmail,queryParameters: parameter.toMap());
      ResponseData<bool> data = ResponseData<bool>.fromJson(result);
      return data.data ?? false;
    }
    on Exception catch(e){
      throw ApiException(message: e.toString());
    }
  }

}
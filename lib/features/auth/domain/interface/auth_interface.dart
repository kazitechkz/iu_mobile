import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/parameters/forget_parameter.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';
import 'package:iu/features/auth/domain/parameters/sign_up_parameter.dart';
import 'package:iu/features/auth/domain/parameters/verify_parameter.dart';

import '../entities/auth_user_entity.dart';

abstract class AuthInterface{
    ResultFuture<AuthUserEntity> signIn(SignInParameter parameter);
    ResultFuture<String> signUp(SignUpParameter parameter);
    ResultFuture<bool> forget(ForgetParameter parameter);
    ResultFuture<bool> verify(VerifyParameter parameter);
}
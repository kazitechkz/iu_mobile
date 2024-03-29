import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/entities/auth_user_entity.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';

import '../interface/auth_interface.dart';

class SignInCase extends UseCaseWithParams<AuthUserEntity,SignInParameter>{
  final AuthInterface authInterface;
  const SignInCase(this.authInterface);
  
  @override
  ResultFuture<AuthUserEntity> call(SignInParameter params) {
    return authInterface.signIn(params);
  }
  
}
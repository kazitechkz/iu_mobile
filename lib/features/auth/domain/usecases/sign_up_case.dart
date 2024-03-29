import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/interface/auth_interface.dart';
import 'package:iu/features/auth/domain/parameters/sign_up_parameter.dart';

class SignUpCase extends UseCaseWithParams<String,SignUpParameter>{
  final AuthInterface authInterface;
  const SignUpCase(this.authInterface);

  @override
  ResultFuture<String> call(SignUpParameter params) {
    return authInterface.signUp(params);
  }
}
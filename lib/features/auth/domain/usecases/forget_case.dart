import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/parameters/forget_parameter.dart';

import '../interface/auth_interface.dart';

class ForgetCase extends UseCaseWithParams<bool,ForgetParameter>{
  final AuthInterface authInterface;
  const ForgetCase(this.authInterface);

  @override
  ResultFuture<bool> call(ForgetParameter params) {
    return authInterface.forget(params);
  }

}
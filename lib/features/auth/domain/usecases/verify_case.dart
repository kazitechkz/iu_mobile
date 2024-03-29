import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/parameters/verify_parameter.dart';

import '../interface/auth_interface.dart';

class VerifyCase extends UseCaseWithParams<bool,VerifyParameter>{
  final AuthInterface authInterface;
  const VerifyCase(this.authInterface);

  @override
  ResultFuture<bool> call(VerifyParameter params) {
    return authInterface.verify(params);
  }

}
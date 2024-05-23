import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/interface/auth_interface.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';

import '../entities/auth_user_entity.dart';

class KundelikSignInCase extends UseCaseWithParams<AuthUserEntity, KundelikSignInParameter> {
  final AuthInterface authInterface;
  const KundelikSignInCase(this.authInterface);
  @override
  ResultFuture<AuthUserEntity> call(KundelikSignInParameter params) async {
    return await authInterface.kundelikSignIn(params);
  }

}
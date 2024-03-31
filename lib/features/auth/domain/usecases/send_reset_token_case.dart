import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/interface/auth_interface.dart';
import 'package:iu/features/auth/domain/parameters/reset_parameter.dart';

class SendResetTokenCase
    extends UseCaseWithParams<bool, SendResetTokenParameter> {
  final AuthInterface authInterface;

  const SendResetTokenCase(this.authInterface);

  @override
  ResultFuture<bool> call(SendResetTokenParameter params) {
    return authInterface.sendResetToken(params);
  }
}

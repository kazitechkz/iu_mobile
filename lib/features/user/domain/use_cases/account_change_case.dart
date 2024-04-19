import 'package:iu/core/utils/typedef.dart';
import '../../../../core/usecases/use_case.dart';
import '../interface/user_interface.dart';
import '../parameters/change_profile_parameters.dart';

class AccountChangeCase
    extends UseCaseWithParams<bool, ChangeProfileParameter> {
  final UserInterface _userInterface;

  const AccountChangeCase(this._userInterface);

  @override
  ResultFuture<bool> call(ChangeProfileParameter params) {
    return this._userInterface.accountChange(params);
  }
}

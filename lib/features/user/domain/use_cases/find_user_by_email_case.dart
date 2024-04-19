import 'package:iu/core/utils/typedef.dart';
import '../../../../core/common/models/ordinary_user.dart';
import '../../../../core/usecases/use_case.dart';
import '../interface/user_interface.dart';
import '../parameters/find_user_by_email_parameter.dart';

class FindUserByEmailCase
    extends UseCaseWithParams<OrdinaryUserEntity, FindUserByEmailParameter> {
  final UserInterface _userInterface;

  const FindUserByEmailCase(this._userInterface);

  @override
  ResultFuture<OrdinaryUserEntity> call(FindUserByEmailParameter params) {
    return this._userInterface.findUserByEmail(params);
  }
}

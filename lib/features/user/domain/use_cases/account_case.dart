import 'package:iu/core/utils/typedef.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/me_entity.dart';
import '../interface/user_interface.dart';

class AccountCase extends UseCaseWithoutParams<MeEntity> {
  final UserInterface _userInterface;

  const AccountCase(this._userInterface);

  @override
  ResultFuture<MeEntity> call() {
    return this._userInterface.account();
  }
}

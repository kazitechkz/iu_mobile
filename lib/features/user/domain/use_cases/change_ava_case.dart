import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/user/domain/parameters/change_profile_parameters.dart';

import '../interface/user_interface.dart';

class ChangeAvaCase extends UseCaseWithParams<bool, ChangeAvatarParameter> {
  final UserInterface _userInterface;
  const ChangeAvaCase(this._userInterface);

  @override
  ResultFuture<bool> call(ChangeAvatarParameter params) async {
    return await _userInterface.changeAvatar(params);
  }
}
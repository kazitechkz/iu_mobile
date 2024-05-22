import '../../../../core/common/models/ordinary_user.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/me_entity.dart';
import '../parameters/change_profile_parameters.dart';
import '../parameters/find_user_by_email_parameter.dart';

abstract class UserInterface{
  ResultFuture<MeEntity> account();
  ResultFuture<bool> accountChange(ChangeProfileParameter parameter);
  ResultFuture<OrdinaryUserEntity> findUserByEmail(FindUserByEmailParameter parameter);
  ResultFuture<bool> changeAvatar(ChangeAvatarParameter parameter);
}
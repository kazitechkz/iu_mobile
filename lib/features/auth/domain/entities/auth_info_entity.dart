import 'package:equatable/equatable.dart';
import 'package:iu/features/auth/domain/entities/auth_user_entity.dart';

class AuthInfoEntity extends Equatable{
  final String token;
  final String role;
  final AuthUserEntity user;
  final bool isFirst;
  final String redirectURL;
  const AuthInfoEntity({required this.token, required this.role,required this.user, required this.isFirst, required this.redirectURL});


  @override
  List<Object?> get props =>[token];
}
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  const SignInEvent(this.parameter);
  final SignInParameter parameter;
  @override
  List<Object?> get props => [parameter.password, parameter.email];
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent(this.parameter);
  final SignUpParameter parameter;
  @override
  List<Object?> get props => [
        parameter.password,
        parameter.email,
        parameter.name,
        parameter.phone,
        parameter.username
      ];
}

class ForgetEvent extends AuthEvent {
  const ForgetEvent(this.parameter);
  final ForgetParameter parameter;
  @override
  List<Object?> get props =>
      [parameter.password, parameter.email, parameter.code];
}

class SendResetTokenEvent extends AuthEvent {
  const SendResetTokenEvent(this.parameter);
  final SendResetTokenParameter parameter;
  @override
  List<Object?> get props => [parameter.email];
}

class VerifyEvent extends AuthEvent {
  const VerifyEvent(this.parameter);
  final VerifyParameter parameter;
  @override
  List<Object?> get props => [parameter.code, parameter.user_id];
}

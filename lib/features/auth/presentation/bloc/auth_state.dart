part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSignedInState extends AuthState {
  final AuthUserEntity userEntity;
  const AuthSignedInState(this.userEntity);
  @override
  List<Object?> get props => [userEntity.id];
}

class AuthSignedUpState extends AuthState {
  final String redirectUrl;
  const AuthSignedUpState(this.redirectUrl);
  @override
  List<Object?> get props => [redirectUrl];
}

class AuthVerifiedState extends AuthState {
  final bool status;
  const AuthVerifiedState(this.status);
  @override
  List<Object?> get props => [status];
}

class AuthSendedResetTokenState extends AuthState {
  final bool status;
  const AuthSendedResetTokenState(this.status);
  @override
  List<Object?> get props => [status];
}

class AuthForgetState extends AuthState {
  final bool status;
  const AuthForgetState(this.status);
  @override
  List<Object?> get props => [status];
}

class AuthErrorState extends AuthState {
  FailureData failureData;
  AuthErrorState(this.failureData);
  @override
  List<Object> get props => [];
}

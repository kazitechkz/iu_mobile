import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:iu/features/auth/domain/entities/auth_user_entity.dart';
import 'package:iu/features/auth/domain/parameters/forget_parameter.dart';
import 'package:iu/features/auth/domain/parameters/reset_parameter.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';
import 'package:iu/features/auth/domain/parameters/verify_parameter.dart';
import 'package:iu/features/auth/domain/usecases/forget_case.dart';
import 'package:iu/features/auth/domain/usecases/send_reset_token_case.dart';
import 'package:iu/features/auth/domain/usecases/sign_in_case.dart';
import 'package:iu/features/auth/domain/usecases/verify_case.dart';

import '../../domain/parameters/sign_up_parameter.dart';
import '../../domain/usecases/sign_up_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {required SignInCase signInCase,
      required SignUpCase signUpCase,
      required ForgetCase forgetCase,
      required VerifyCase verifyCase,
      required SendResetTokenCase sendResetTokenCase})
      : _signInCase = signInCase,
        _signUpCase = signUpCase,
        _forgetCase = forgetCase,
        _verifyCase = verifyCase,
        _sendResetTokenCase = sendResetTokenCase,
        super(AuthInitialState()) {
    on<SignInEvent>(_signInHandler);
    on<SignUpEvent>(_signUpHandler);
    on<ForgetEvent>(_forgetHandler);
    on<VerifyEvent>(_verifyHandler);
    on<SendResetTokenEvent>(_sendResetTokenHandler);
  }

  final SignInCase _signInCase;
  final SignUpCase _signUpCase;
  final ForgetCase _forgetCase;
  final VerifyCase _verifyCase;
  final SendResetTokenCase _sendResetTokenCase;

  Future<void> _signInHandler(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await _signInCase(event.parameter);
    result.fold(
        (failure) => emit(AuthErrorState(FailureData.fromApiFailure(failure))),
        (success) => emit(AuthSignedInState(success)));
  }

  Future<void> _signUpHandler(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await _signUpCase(event.parameter);
    result.fold(
        (failure) => emit(AuthErrorState(FailureData.fromApiFailure(failure))),
        (success) => emit(AuthSignedUpState(success)));
  }

  Future<void> _forgetHandler(
      ForgetEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await _forgetCase(event.parameter);
    result.fold(
        (failure) => emit(AuthErrorState(FailureData.fromApiFailure(failure))),
        (success) => emit(AuthForgetState(success)));
  }

  Future<void> _sendResetTokenHandler(
      SendResetTokenEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await _sendResetTokenCase(event.parameter);
    result.fold(
        (failure) => emit(AuthErrorState(FailureData.fromApiFailure(failure))),
        (success) => emit(AuthSendedResetTokenState(success)));
  }

  Future<void> _verifyHandler(
      VerifyEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await _verifyCase(event.parameter);
    result.fold(
        (failure) => emit(AuthErrorState(FailureData.fromApiFailure(failure))),
        (success) => emit(AuthVerifiedState(success)));
  }
}

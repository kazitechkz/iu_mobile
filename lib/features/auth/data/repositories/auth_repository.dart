import 'package:dartz/dartz.dart';
import 'package:iu/core/errors/exception.dart';
import 'package:iu/core/errors/failure.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/data/datasources/auth_datasource.dart';
import 'package:iu/features/auth/domain/entities/auth_user_entity.dart';
import 'package:iu/features/auth/domain/interface/auth_interface.dart';
import 'package:iu/features/auth/domain/parameters/forget_parameter.dart';
import 'package:iu/features/auth/domain/parameters/reset_parameter.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';
import 'package:iu/features/auth/domain/parameters/sign_up_parameter.dart';
import 'package:iu/features/auth/domain/parameters/verify_parameter.dart';

class AuthRepository implements AuthInterface {
  final AuthDataSourceInterface authDataSourceInterface;
  const AuthRepository(this.authDataSourceInterface);

  @override
  ResultFuture<bool> forget(ForgetParameter parameter) async {
    try {
      final result = await authDataSourceInterface.forgetDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<AuthUserEntity> signIn(SignInParameter parameter) async {
    try {
      final result = await authDataSourceInterface.signInDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<String> signUp(SignUpParameter parameter) async {
    try {
      final result = await authDataSourceInterface.signUpDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<bool> verify(VerifyParameter parameter) async {
    try {
      final result = await authDataSourceInterface.verifyDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<bool> sendResetToken(SendResetTokenParameter parameter) async {
    try {
      final result = await authDataSourceInterface.sendResetTokenDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<AuthUserEntity> googleSignIn(GoogleSignInParameter params) async {
    try {
      final result = await authDataSourceInterface.googleSignIn(params);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<AuthUserEntity> kundelikSignIn(KundelikSignInParameter params) async {
    try {
      final result = await authDataSourceInterface.kundelikSignIn(params);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }
}

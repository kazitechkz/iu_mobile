import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/user/domain/entities/me_entity.dart';
import 'package:iu/features/user/domain/parameters/change_profile_parameters.dart';
import 'package:iu/features/user/domain/parameters/find_user_by_email_parameter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/injection_main.container.dart';
import '../../domain/interface/user_interface.dart';
import '../datasources/user_datasource.dart';

class UserRepository implements UserInterface{
  final UserDataSourceInterface _userDataSourceInterface;
  const UserRepository(this._userDataSourceInterface);
  @override
  ResultFuture<MeEntity> account() async {
    try {
      final result = await _userDataSourceInterface.accountDS();
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
  ResultFuture<bool> accountChange(ChangeProfileParameter parameter) async {
    try {
      final result = await _userDataSourceInterface.accountChangeDS(parameter);
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
  ResultFuture<OrdinaryUserEntity> findUserByEmail(FindUserByEmailParameter parameter) async {
    try {
      final result = await _userDataSourceInterface.findUserByEmailDS(parameter);
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
  ResultFuture<bool> changeAvatar(ChangeAvatarParameter parameter) async {
    try {
      final result = await _userDataSourceInterface.changeAva(parameter);
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
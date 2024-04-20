import 'package:dartz/dartz.dart';
import 'package:iu/core/errors/exception.dart';
import 'package:iu/core/errors/failure.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/data/datasources/appeal_datasources.dart';
import 'package:iu/features/appeal/domain/entities/appeal_entity.dart';
import 'package:iu/features/appeal/domain/entities/appeal_type_entity.dart';
import 'package:iu/features/appeal/domain/interfaces/appeal_interface.dart';
import 'package:iu/features/appeal/domain/parameters/appeal_params.dart';
import 'package:iu/features/appeal/domain/parameters/create_appeal_params.dart';

import '../../../../core/common/models/pagination_data.dart';

class AppealRepository implements AppealInterface {
  final AppealDatasourceInterface appealDatasourceInterface;
  AppealRepository(this.appealDatasourceInterface);
  @override
  ResultFuture<List<AppealTypeEntity>> getAppealTypes() async {
    try {
      return Right(await appealDatasourceInterface.getAppealTypes());
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    } on Exception catch (e) {
      return Left(ApiFailure.fromException(ApiException(message: e.toString())));
    }
  }

  @override
  ResultFuture<bool> createAppeal(CreateAppealParams params) async {
    try {
      return Right(await appealDatasourceInterface.createAppeal(params));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    } on Exception catch (e) {
      return Left(ApiFailure.fromException(ApiException(message: e.toString())));
    }
  }

  @override
  ResultFuture<PaginationData<List<AppealEntity>>> getMyAppeals(AppealParams params) async {
    try {
      return Right(await appealDatasourceInterface.getMyAppeals(params));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    } on Exception catch (e) {
      return Left(ApiFailure.fromException(ApiException(message: e.toString())));
    }
  }

  @override
  ResultFuture<AppealEntity> getMyAppealById(int appealId) async {
    // TODO: implement getMyAppealById
    throw UnimplementedError();
  }

}
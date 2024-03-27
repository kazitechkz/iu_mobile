import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/welcome/data/datasources/welcome_datasource.dart';
import 'package:iu/features/welcome/domain/interfaces/welcome_interface.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class WelcomeRepository implements WelcomeInterface{
  final WelcomeDataSourceInterface welcomeDataSourceInterface;
  const WelcomeRepository(this.welcomeDataSourceInterface);

  @override
  ResultFutureVoid cacheVisited()async {
    try{
      await welcomeDataSourceInterface.cacheVisitedDS();
      return const Right(null);
    }
    on CacheException catch(e){
      CacheFailure failure = CacheFailure.fromException(e);
      return Left(failure);
    }
    on Exception catch(e){
      var exception =  CacheException(message: e.toString());
      CacheFailure failure = CacheFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<bool> checkIsFirstTime()async {
    try{
      bool result = await welcomeDataSourceInterface.checkIsFirstTimeDS();
      return Right(result);
    }
    on CacheException catch(e){
      CacheFailure failure = CacheFailure.fromException(e);
      return Left(failure);
    }
    on Exception catch(e){
      var exception =  CacheException(message: e.toString());
      CacheFailure failure = CacheFailure.fromException(exception);
      return Left(failure);
    }
  }



}
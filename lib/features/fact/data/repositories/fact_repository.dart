import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/fact/data/datasources/fact_datasource.dart';
import 'package:iu/features/fact/domain/entities/fact_entity.dart';
import 'package:iu/features/fact/domain/interface/fact_interface.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class FactRepository extends FactInterface {
  final FactDatasourceInterface _factDataSourceInterface;
  FactRepository(this._factDataSourceInterface);

  @override
  ResultFuture<FactEntity> getFact(String subjectID) async {
    try {
      final result = await _factDataSourceInterface.getFact(subjectID);
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
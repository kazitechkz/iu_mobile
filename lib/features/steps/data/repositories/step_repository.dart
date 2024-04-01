import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/steps/data/datasources/step_datasource.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import 'package:iu/features/steps/domain/interface/step_interface.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class StepRepository implements StepInterface {
  final StepDataSourceInterface stepDataSourceInterface;
  const StepRepository(this.stepDataSourceInterface);
  @override
  ResultFuture<List<StepEntity>> getAll() async {
    try {
      final result = await stepDataSourceInterface.getAll();
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

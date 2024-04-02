import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/unt/data/datasources/unt_datasource.dart';
import 'package:iu/features/unt/domain/interfaces/unt_interface.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class UntRepository extends UntInterface{
  final UntDataSourceInterface untDataSourceInterface;
   UntRepository(this.untDataSourceInterface);

  @override
  ResultFuture<List<SubjectEntity>> getSubjects()async {
    try {
      final result = await untDataSourceInterface.getSubjectsDS();
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
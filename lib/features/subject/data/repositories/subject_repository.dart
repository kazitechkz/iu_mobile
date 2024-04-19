import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/subject/data/datasources/subject_datasource.dart';
import 'package:iu/features/subject/domain/interface/subject_interface.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class SubjectRepository extends SubjectInterface {
  SubjectDatasourceInterface subjectDatasourceInterface;
  SubjectRepository(this.subjectDatasourceInterface);

  @override
  ResultFuture<List<SubjectEntity>> getSubjects() async {
    try {
      final result = await subjectDatasourceInterface.getSubjects();
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
  ResultFuture<List<SubjectEntity>> getMySubjects() async {
    try {
      final result = await subjectDatasourceInterface.getMySubjects();
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
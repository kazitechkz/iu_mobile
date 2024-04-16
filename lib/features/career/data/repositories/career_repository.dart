import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pay_entity.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/career/data/datasources/career_datasource.dart';
import 'package:iu/features/career/domain/entities/career_quiz_attempt_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_entity.dart';
import 'package:iu/features/career/domain/entities/get_career_quiz_entity.dart';
import 'package:iu/features/career/domain/entities/get_career_quiz_group_list_entity.dart';
import 'package:iu/features/career/domain/entities/get_career_quizzes_entity.dart';
import 'package:iu/features/career/domain/interface/career_interface.dart';
import 'package:iu/features/career/domain/parameters/finish_career_quiz_parameter.dart';
import 'package:iu/features/career/domain/parameters/get_career_quizzes_parameter.dart';
import 'package:iu/features/career/domain/parameters/my_career_attempts_parameter.dart';
import 'package:iu/features/career/domain/parameters/pay_career_parameter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';



class CareerRepository implements CareerInterface {

  final CareerDataSourceInterface careerDataSourceInterface;
  const CareerRepository(this.careerDataSourceInterface);

  @override
  ResultFuture<int> finishCareer(FinishCareerQuizParameter parameter)async {
    try {
      final result = await this.careerDataSourceInterface.finishCareerDS(parameter);
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
  ResultFuture<GetCareerQuizEntity> getCareerQuiz(int parameter)async {
    try {
      final result = await this.careerDataSourceInterface.getCareerQuizDS(parameter);
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
  ResultFuture<GetCareerQuizGroupListEntity> getCareerQuizGroupList()async {
    try {
      final result = await this.careerDataSourceInterface.getCareerQuizGroupListDS();
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
  ResultFuture<GetCareerQuizzesEntity> getCareerQuizzes(GetCareerQuizzesParameter parameter)async {
    try {
      final result = await this.careerDataSourceInterface.getCareerQuizzesDS(parameter);
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
  ResultFuture<PaginationData<List<CareerQuizAttemptEntity>>> myCareerAttempts(MyCareerAttemptsParameter parameter)async {
    try {
      final result = await this.careerDataSourceInterface.myCareerAttemptsDS(parameter);
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
  ResultFuture<CareerQuizEntity> passCareerQuiz(int parameter)async {
    try {
      final result = await this.careerDataSourceInterface.passCareerQuizDS(parameter);
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
  ResultFuture<PayModel> payCareer(PayCareerParameter parameter)async {
    try {
      final result = await this.careerDataSourceInterface.payCareerDS(parameter);
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
  ResultFuture<CareerQuizAttemptEntity> resultCareerQuiz(int parameter)async {
    try {
      final result = await this.careerDataSourceInterface.resultCareerQuizDS(parameter);
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

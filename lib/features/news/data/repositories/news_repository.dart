import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/news/data/datasources/news_datasource.dart';
import 'package:iu/features/news/domain/entities/news_entity.dart';
import 'package:iu/features/news/domain/interface/news_interface.dart';
import 'package:iu/features/news/domain/parameters/all_news_parameter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class NewsRepository extends NewsInterface {
  final NewsDataSourceInterface newsDataSourceInterface;
  NewsRepository(this.newsDataSourceInterface);

  @override
  ResultFuture<PaginationData<List<NewsEntity>>> allNews(
      AllNewsParameter parameter) async {
    try {
      final result = await this.newsDataSourceInterface.allNewsDS(parameter);
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
  ResultFuture<NewsEntity> getImportantNews() async {
    try {
      final result = await this.newsDataSourceInterface.getImportantNewsDS();
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
  ResultFuture<NewsEntity> getSingleNews(String parameter) async {
    try {
      final result =
          await this.newsDataSourceInterface.getSingleNewsDS(parameter);
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

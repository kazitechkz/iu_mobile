import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/forum/data/datasources/forum_datasource.dart';
import 'package:iu/features/forum/domain/entities/dicuss_rating_entity.dart';
import 'package:iu/features/forum/domain/entities/discuss_entity.dart';
import 'package:iu/features/forum/domain/entities/forum_entity.dart';
import 'package:iu/features/forum/domain/entities/get_forum_discuss_entity.dart';
import 'package:iu/features/forum/domain/entities/get_forum_entity.dart';
import 'package:iu/features/forum/domain/interface/forum_interface.dart';
import 'package:iu/features/forum/domain/parameters/all_forum_parameter.dart';
import 'package:iu/features/forum/domain/parameters/create_discuss_parameter.dart';
import 'package:iu/features/forum/domain/parameters/create_forum_parameter.dart';
import 'package:iu/features/forum/domain/parameters/get_forum_discuss_parameter.dart';
import 'package:iu/features/forum/domain/parameters/rating_forum_parameter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class ForumRepository extends ForumInterface{

  final ForumDataSourceInterface _forumDataSourceInterface;
  ForumRepository(this._forumDataSourceInterface);

  @override
  ResultFuture<PaginationData<List<ForumEntity>>> allForum(AllForumParameter parameter) async {
    try {
      final result = await this._forumDataSourceInterface.allForumDS(parameter);
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
  ResultFuture<DiscussEntity> createDiscuss(CreateDiscussParameter parameter) async {
    try {
      final result = await this._forumDataSourceInterface.createDiscussDS(parameter);
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
  ResultFuture<ForumEntity> createForum(CreateForumParameter parameter) async {
    try {
      final result = await this._forumDataSourceInterface.createForumDS(parameter);
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
  ResultFuture<GetForumEntity> getForum(int parameter) async {
    try {
      final result = await this._forumDataSourceInterface.getForumDS(parameter);
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
  ResultFuture<GetForumDiscussEntity> getForumDiscuss(GetForumDiscussParameter parameter) async {
    try {
      final result = await this._forumDataSourceInterface.getForumDiscussDS(parameter);
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
  ResultFuture<DiscussRatingEntity> ratingForum(RatingForumParameter parameter) async {
    try {
      final result = await this._forumDataSourceInterface.ratingForumDS(parameter);
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
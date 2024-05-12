import 'package:dio/dio.dart';
import 'package:iu/features/forum/data/models/dicuss_rating_model.dart';
import 'package:iu/features/forum/data/models/discuss_model.dart';
import 'package:iu/features/forum/data/models/forum_model.dart';
import 'package:iu/features/forum/data/models/get_forum_discuss_model.dart';
import 'package:iu/features/forum/data/models/get_forum_model.dart';
import 'package:iu/features/forum/domain/parameters/get_forum_discuss_parameter.dart';
import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/dicuss_rating_entity.dart';
import '../../domain/entities/discuss_entity.dart';
import '../../domain/entities/forum_entity.dart';
import '../../domain/entities/get_forum_discuss_entity.dart';
import '../../domain/entities/get_forum_entity.dart';
import '../../domain/parameters/all_forum_parameter.dart';
import '../../domain/parameters/create_discuss_parameter.dart';
import '../../domain/parameters/create_forum_parameter.dart';
import '../../domain/parameters/rating_forum_parameter.dart';

abstract class ForumDataSourceInterface {
  Future<PaginationData<List<ForumEntity>>> allForumDS(
      AllForumParameter parameter);

  Future<DiscussEntity> createDiscussDS(CreateDiscussParameter parameter);

  Future<ForumEntity> createForumDS(CreateForumParameter parameter);

  Future<GetForumEntity> getForumDS(int parameter);

  Future<GetForumDiscussEntity> getForumDiscussDS(
      GetForumDiscussParameter parameter);

  Future<DiscussRatingEntity> ratingForumDS(RatingForumParameter parameter);
}

class ForumDataSourceImpl extends ForumDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<PaginationData<List<ForumEntity>>> allForumDS(
      AllForumParameter parameter) async {
    try {
      final response =
          await httpUtils.get(ApiConstant.allForum, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<ForumEntity> data = ForumModel.fromMapList(
          paginationData.data.cast<Map<String, dynamic>>());
      final result = PaginationData.fromType(paginationData, data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<DiscussEntity> createDiscussDS(
      CreateDiscussParameter parameter) async {
    try {
      final response = await httpUtils.post(ApiConstant.createDiscuss,
          data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = DiscussModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<ForumEntity> createForumDS(CreateForumParameter parameter) async {
    try {
      final response = await httpUtils.post(ApiConstant.forumCreate,
          data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = ForumModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetForumEntity> getForumDS(int parameter) async {
    try {
      final response =
          await httpUtils.get(ApiConstant.getForum + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = GetForumModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetForumDiscussEntity> getForumDiscussDS(
      GetForumDiscussParameter parameter) async {
    try {
      final response = await httpUtils.get(
          ApiConstant.getForumDiscuss + parameter.forum_id.toString(),
          data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = GetForumDiscussModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<DiscussRatingEntity> ratingForumDS(
      RatingForumParameter parameter) async {
    try {
      final response =
          await httpUtils.get(ApiConstant.ratingForum, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = DiscussRatingModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

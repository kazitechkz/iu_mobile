import 'package:dio/dio.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/features/iutube/data/models/get_main_videos_model.dart';
import 'package:iu/features/iutube/data/models/get_video_detail_model.dart';
import 'package:iu/features/iutube/data/models/iutube_video_model.dart';
import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/get_main_videos_entity.dart';
import '../../domain/entities/get_video_author_detail_entity.dart';
import '../../domain/entities/get_video_detail_entity.dart';
import '../../domain/entities/iutube_video_entity.dart';
import '../../domain/parameters/get_all_videos_parameter.dart';
import '../../domain/parameters/get_video_author_detail_parameter.dart';
import '../../domain/parameters/get_video_detail_parameter.dart';
import '../models/get_video_author_detail_model.dart';

abstract class IUTubeDataSourceInterface {
  Future<PaginationData<List<IUTubeVideoEntity>>> getAllVideosDS(
      GetAllVideosParameter parameter);
  Future<GetMainVideosEntity> getMainVideosDS();
  Future<GetVideoAuthorDetailEntity> getVideoAuthorDS(
      GetVideoAuthorDetailParameter parameter);
  Future<GetVideoDetailEntity> getVideoDetailDS(
      GetVideoDetailParameter parameter);
}

class IUTubeDataSourceImpl extends IUTubeDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<PaginationData<List<IUTubeVideoEntity>>> getAllVideosDS(
      GetAllVideosParameter parameter) async {
    try {
      final response = await httpUtils.get(ApiConstant.getAllVideos,
          data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final paginationData = PaginationData.fromMap(responseData.data);
      final data = IUTubeVideoModel.fromMapList(
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
  Future<GetMainVideosEntity> getMainVideosDS() async {
    try {
      final response = await httpUtils.get(ApiConstant.getMainVideos);
      final responseData = ResponseData.fromJson(response);
      final result = GetMainVideosModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetVideoAuthorDetailEntity> getVideoAuthorDS(
      GetVideoAuthorDetailParameter parameter) async {
    try {
      final response = await httpUtils.get(
          ApiConstant.getVideoAuthor + parameter.id.toString(),
          data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = GetVideoAuthorDetailModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetVideoDetailEntity> getVideoDetailDS(
      GetVideoDetailParameter parameter) async {
    try {
      final response = await httpUtils
          .get(ApiConstant.getVideoDetail + parameter.alias.toString());
      final responseData = ResponseData.fromJson(response);
      final result = GetVideoDetailModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

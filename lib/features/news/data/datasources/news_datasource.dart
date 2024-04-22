import 'package:dio/dio.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/features/news/data/models/news_model.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/parameters/all_news_parameter.dart';

abstract class NewsDataSourceInterface {
  Future<PaginationData<List<NewsEntity>>> allNewsDS(
      AllNewsParameter parameter);

  Future<NewsEntity> getImportantNewsDS();

  Future<NewsEntity> getSingleNewsDS(String parameter);
}

class NewsDataSourceImpl implements NewsDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<PaginationData<List<NewsEntity>>> allNewsDS(
      AllNewsParameter parameter) async {
    try {
      final response =
          await httpUtils.get(ApiConstant.getAllNews, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      PaginationData paginationData = PaginationData.fromMap(responseData.data);
      List<NewsEntity> data = NewsModel.fromMapList(
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
  Future<NewsEntity> getImportantNewsDS() async {
    try {
      final response = await httpUtils.get(ApiConstant.getImportantNews);
      final responseData = ResponseData.fromJson(response);
      final result = NewsModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<NewsEntity> getSingleNewsDS(String parameter) async {
    try {
      final response = await httpUtils
          .get(ApiConstant.getSingleNews + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = NewsModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}

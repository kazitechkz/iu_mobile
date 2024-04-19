import 'package:dio/dio.dart';
import 'package:iu/core/common/models/categories.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/category/domain/parameters/category_params.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';

abstract class CategoryDatasourceInterface {
  Future<List<CategoryEntity>> getCategories(CategoryParams params);
}

class CategoryDatasourceImpl implements CategoryDatasourceInterface {
  final httpUtils = HttpUtil();
  @override
  Future<List<CategoryEntity>> getCategories(CategoryParams params) async {
    try {
      final response = await httpUtils.get('${ApiConstant.getSubCategories}/${params.subjectID}/${params.localeID}');
      final responseData = ResponseData.fromJson(response);
      List<CategoryEntity> data = CategoryModel.fromMapList(
          responseData.data.cast<DataMap>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
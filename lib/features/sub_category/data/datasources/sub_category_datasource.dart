import 'package:dio/dio.dart';
import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/sub_category/domain/parameters/sub_category_params.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/typedef.dart';

abstract class SubCategoryDatasourceInterface {
  Future<List<SubCategoryEntity>> getSubCategories(SubCategoryParams params);
}

class SubCategoryDatasourceImpl implements SubCategoryDatasourceInterface {
  final httpUtils = HttpUtil();
  @override
  Future<List<SubCategoryEntity>> getSubCategories(SubCategoryParams params) async {
    try {
      final response = await httpUtils.get('${ApiConstant.getCategories}/${params.category_id}/${params.locale_id}');
      final responseData = ResponseData.fromJson(response);
      List<SubCategoryEntity> data = SubCategoryModel.fromMapList(
          responseData.data.cast<DataMap>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
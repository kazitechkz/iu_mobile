import 'package:dio/dio.dart';
import 'package:iu/features/fact/data/models/fact_model.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/fact_entity.dart';

abstract class FactDatasourceInterface {
  Future<FactEntity> getFact(String subjectID);
}

class FactDatasourceImpl implements FactDatasourceInterface {
  final httpUtils = HttpUtil();

  @override
  Future<FactEntity> getFact(String subjectID) async {
    try {
      final response = await httpUtils.get(ApiConstant.getFact+subjectID);
      final responseData = ResponseData.fromJson(response);
      FactEntity data = FactModel.fromJson(responseData.data);
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
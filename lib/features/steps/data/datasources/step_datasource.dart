import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/errors/exception.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/auth/domain/parameters/reset_parameter.dart';
import '../../domain/entities/step_entity.dart';
import '../models/step_model.dart';

abstract class StepDataSourceInterface {
  Future<List<StepEntity>> getAll();
}

class StepDataSourceImpl extends StepDataSourceInterface {
  final httpUtils = HttpUtil();

  @override
  Future<List<StepEntity>> getAll() async {
    try {
      final result = await httpUtils.get(ApiConstant.getAllStep);
      ResponseData<List<dynamic>> res = ResponseData<List<dynamic>>.fromJson(result);
      print(res.status);
      List<StepEntity> entities = [];
      res.data?.forEach((item){
        entities.add(StepModel.fromJson(item));
      });
      return entities;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}

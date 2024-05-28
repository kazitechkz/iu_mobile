import 'package:dio/dio.dart';
import 'package:iu/features/subscription/data/models/paybox_model.dart';
import 'package:iu/features/subscription/domain/parameters/paybox_parameters.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/paybox_entity.dart';

abstract class PayBoxDatasourceInterface {
  Future<PayBoxEntity> initPay(PayBoxRequest params);
}

class PayBoxDatasourceImpl implements PayBoxDatasourceInterface {
  final httpUtils = HttpUtil();
  @override
  Future<PayBoxEntity> initPay(PayBoxRequest params) async {
    try {
      final response = await httpUtils.post(ApiConstant.getInitPay, data: params.toJson());
      final responseData = ResponseData.fromJson(response);
      PayBoxEntity data = PayBoxModel.fromJson(responseData.data);
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
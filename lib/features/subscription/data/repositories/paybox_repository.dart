import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/subscription/data/datasources/paybox_datasource.dart';
import 'package:iu/features/subscription/domain/entities/paybox_entity.dart';
import 'package:iu/features/subscription/domain/interface/paybox_interface.dart';
import 'package:iu/features/subscription/domain/parameters/paybox_parameters.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class PayBoxRepository implements PayBoxInterface {
  final PayBoxDatasourceInterface payBoxDatasourceInterface;
  const PayBoxRepository(this.payBoxDatasourceInterface);
  @override
  ResultFuture<PayBoxEntity> initPay(PayBoxRequest params) async {
    try {
      final result = await payBoxDatasourceInterface.initPay(params);
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
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/subscription/domain/entities/paybox_entity.dart';
import 'package:iu/features/subscription/domain/interface/paybox_interface.dart';
import 'package:iu/features/subscription/domain/parameters/paybox_parameters.dart';

class PayBoxUseCase extends UseCaseWithParams<PayBoxEntity, PayBoxRequest> {
  final PayBoxInterface payBoxInterface;
  const PayBoxUseCase(this.payBoxInterface);
  @override
  ResultFuture<PayBoxEntity> call(PayBoxRequest params) async {
    return await payBoxInterface.initPay(params);
  }
}
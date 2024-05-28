import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/subscription/domain/parameters/paybox_parameters.dart';

import '../entities/paybox_entity.dart';

abstract class PayBoxInterface {
  ResultFuture<PayBoxEntity> initPay(PayBoxRequest params);
}
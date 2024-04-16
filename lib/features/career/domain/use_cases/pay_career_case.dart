import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../../../../core/common/models/pay_entity.dart';
import '../interface/career_interface.dart';
import '../parameters/pay_career_parameter.dart';

class PayCareerCase extends UseCaseWithParams<PayModel,PayCareerParameter>{
  final CareerInterface _careerInterface;
  const PayCareerCase(this._careerInterface);

  @override
  ResultFuture<PayModel> call(PayCareerParameter params) {
   return this._careerInterface.payCareer(params);
  }


}
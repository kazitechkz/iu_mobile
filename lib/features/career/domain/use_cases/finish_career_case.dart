import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/career/domain/interface/career_interface.dart';

import '../parameters/finish_career_quiz_parameter.dart';

class FinishCareerCase extends UseCaseWithParams<int,FinishCareerQuizParameter>{
  final CareerInterface _careerInterface;
  const FinishCareerCase(this._careerInterface);

  @override
  ResultFuture<int> call(FinishCareerQuizParameter params) {
    return this._careerInterface.finishCareer(params);
  }
}
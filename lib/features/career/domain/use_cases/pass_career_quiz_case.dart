import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/career_quiz_entity.dart';
import '../interface/career_interface.dart';

class PassCareerQuizCase extends UseCaseWithParams<CareerQuizEntity,int>{
  final CareerInterface _careerInterface;
  const PassCareerQuizCase(this._careerInterface);

  @override
  ResultFuture<CareerQuizEntity> call(int params) {
    return this._careerInterface.passCareerQuiz(params);
  }

}
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_career_quiz_entity.dart';
import '../interface/career_interface.dart';

class GetCareerQuizCase extends UseCaseWithParams<GetCareerQuizEntity,int>{
  final CareerInterface _careerInterface;
  const GetCareerQuizCase(this._careerInterface);
  @override
  ResultFuture<GetCareerQuizEntity> call(int params) {
    return this._careerInterface.getCareerQuiz(params);
  }
}
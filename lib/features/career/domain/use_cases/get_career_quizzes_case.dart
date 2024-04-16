import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../entities/get_career_quizzes_entity.dart';
import '../interface/career_interface.dart';
import '../parameters/get_career_quizzes_parameter.dart';

class GetCareerQuizzesCase extends UseCaseWithParams<GetCareerQuizzesEntity,GetCareerQuizzesParameter>{
  final CareerInterface _careerInterface;
  const GetCareerQuizzesCase(this._careerInterface);

  @override
  ResultFuture<GetCareerQuizzesEntity> call(GetCareerQuizzesParameter params) {
    return this._careerInterface.getCareerQuizzes(params);
  }

}
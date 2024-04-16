import 'package:iu/core/utils/typedef.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/career_quiz_attempt_entity.dart';
import '../interface/career_interface.dart';

class ResultCareerQuiz extends UseCaseWithParams<CareerQuizAttemptEntity,int>{
  final CareerInterface _careerInterface;
  const ResultCareerQuiz(this._careerInterface);

  @override
  ResultFuture<CareerQuizAttemptEntity> call(int params) {
    return this._careerInterface.resultCareerQuiz(params);
  }

}
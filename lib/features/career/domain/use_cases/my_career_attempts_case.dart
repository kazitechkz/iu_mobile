import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../entities/career_quiz_attempt_entity.dart';
import '../interface/career_interface.dart';
import '../parameters/my_career_attempts_parameter.dart';

class MyCareerAttemptsCase extends UseCaseWithParams<PaginationData<List<CareerQuizAttemptEntity>>,MyCareerAttemptsParameter>{
  final CareerInterface _careerInterface;
  const MyCareerAttemptsCase(this._careerInterface);

  @override
  ResultFuture<PaginationData<List<CareerQuizAttemptEntity>>> call(MyCareerAttemptsParameter params) {
    return this._careerInterface.myCareerAttempts(params);
  }

}
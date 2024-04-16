import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../entities/get_career_quiz_group_list_entity.dart';
import '../interface/career_interface.dart';

class GetCareerQuizGroupListCase
    extends UseCaseWithoutParams<GetCareerQuizGroupListEntity> {
  final CareerInterface _careerInterface;

  const GetCareerQuizGroupListCase(this._careerInterface);

  @override
  ResultFuture<GetCareerQuizGroupListEntity> call() {
    return this._careerInterface.getCareerQuizGroupList();
  }
}

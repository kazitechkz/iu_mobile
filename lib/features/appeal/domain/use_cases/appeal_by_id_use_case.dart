import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/domain/entities/appeal_entity.dart';
import 'package:iu/features/appeal/domain/interfaces/appeal_interface.dart';

class AppealByIdCase extends UseCaseWithParams<AppealEntity, int> {
  final AppealInterface appealInterface;
  AppealByIdCase(this.appealInterface);
  @override
  ResultFuture<AppealEntity> call(int params) async {
    return await appealInterface.getMyAppealById(params);
  }

}
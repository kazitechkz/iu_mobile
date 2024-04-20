import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/domain/interfaces/appeal_interface.dart';
import 'package:iu/features/appeal/domain/parameters/create_appeal_params.dart';

class CreateAppealUseCase extends UseCaseWithParams<bool, CreateAppealParams> {
  final AppealInterface appealInterface;
  CreateAppealUseCase(this.appealInterface);
  @override
  ResultFuture<bool> call(CreateAppealParams params) async {
    return await appealInterface.createAppeal(params);
  }

}
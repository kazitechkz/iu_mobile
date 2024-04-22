import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/domain/interfaces/attempt_setting_interface.dart';
import 'package:iu/features/attempt_setting/domain/parameters/create_attempt_setting_params.dart';

import '../entities/attempt_setting_entity.dart';

class CreateAttemptSettingUseCase extends UseCaseWithParams<AttemptSettingEntity, CreateAttemptSettingParams> {
  final AttemptSettingInterface attemptSettingInterface;
  CreateAttemptSettingUseCase(this.attemptSettingInterface);
  @override
  ResultFuture<AttemptSettingEntity> call(CreateAttemptSettingParams params) async {
    return await attemptSettingInterface.createAttemptSetting(params);
  }

}
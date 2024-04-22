import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pagination_parameter.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/attempt_setting_unt_entity.dart';
import '../interfaces/attempt_setting_interface.dart';

class MyAttemptSettingsUntUseCase extends UseCaseWithParams<PaginationData<List<AttemptSettingUntEntity>>, PaginationParameter> {
  final AttemptSettingInterface attemptSettingInterface;
  MyAttemptSettingsUntUseCase(this.attemptSettingInterface);
  @override
  ResultFuture<PaginationData<List<AttemptSettingUntEntity>>> call(PaginationParameter params) async {
    return await attemptSettingInterface.myAttemptSettingUnt(params);
  }

}
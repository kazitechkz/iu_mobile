import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_entity.dart';

import '../../../attempt/domain/entities/attempt_entity.dart';

class AttemptSettingResultEntity extends Equatable {
  final int settingId;
  final int attemptId;
  final AttemptSettingEntity? attemptSetting;
  final AttemptEntity? attempt;

  const AttemptSettingResultEntity({required this.settingId, required this.attemptId, this.attemptSetting, this.attempt});

  @override
  List<Object?> get props => [settingId, attemptId, attemptSetting, attempt];
}
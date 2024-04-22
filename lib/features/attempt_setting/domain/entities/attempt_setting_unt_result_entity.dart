import 'package:equatable/equatable.dart';

import '../../../attempt/domain/entities/attempt_entity.dart';
import 'attempt_setting_entity.dart';

class AttemptSettingUntResultEntity extends Equatable {
  final int settingId;
  final int attemptId;
  final AttemptSettingEntity? attemptSetting;
  final AttemptEntity? attempt;

  const AttemptSettingUntResultEntity({required this.settingId, required this.attemptId, this.attemptSetting, this.attempt});
  @override
  List<Object?> get props => [settingId, attemptId, attemptSetting, attempt];
}
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_unt_result_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../../attempt/data/models/attempt_model.dart';
import 'attempt_setting_model.dart';

class AttemptSettingUntResultModel extends AttemptSettingUntResultEntity {
  const AttemptSettingUntResultModel({
    required super.settingId,
    required super.attemptId,
    super.attempt,
    super.attemptSetting
  });

  factory AttemptSettingUntResultModel.fromJson(DataMap json) {
    return AttemptSettingUntResultModel(
        settingId: json['settingId'] as int,
        attemptId: json['attemptId'] as int,
        attempt: json['attempt'] != null ? AttemptModel.fromJson(json['attempt']) : null,
        attemptSetting: json['attempt_setting'] != null ? AttemptSettingModel.fromJson(json['attempt_setting']) : null
    );
  }

  static List<AttemptSettingUntResultModel> fromJsonList(List<DataMap> mapList) {
    return mapList.map((data) => AttemptSettingUntResultModel.fromJson(data)).toList();
  }
}
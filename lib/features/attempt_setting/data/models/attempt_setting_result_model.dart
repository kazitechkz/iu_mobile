import 'package:iu/features/attempt_setting/data/models/attempt_setting_model.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_result_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../../attempt/data/models/attempt_model.dart';

class AttemptSettingResultModel extends AttemptSettingResultEntity {
  const AttemptSettingResultModel({
    required super.settingId,
    required super.attemptId,
    super.attempt,
    super.attemptSetting
  });

  factory AttemptSettingResultModel.fromJson(DataMap json) {
    return AttemptSettingResultModel(
        settingId: json['setting_id'] as int,
        attemptId: json['attempt_id'] as int,
        attempt: json['attempt'] != null ? AttemptModel.fromJson(json['attempt']) : null,
        attemptSetting: json['attempt_setting'] != null ? AttemptSettingModel.fromJson(json['attempt_setting']) : null
    );
  }

  static List<AttemptSettingResultModel> fromJsonList(List<DataMap> mapList) {
    return mapList.map((data) => AttemptSettingResultModel.fromJson(data)).toList();
  }
}
import 'package:iu/features/attempt/domain/entities/answered_result_entity.dart';

import '../../../../core/utils/typedef.dart';

class AnsweredResultModel extends AnsweredResultEntity {
  AnsweredResultModel(super.data);

  factory AnsweredResultModel.fromMap(Map<String, dynamic> originalMap) {
    Map<int, List<String?>> convertedMap = {};
    originalMap.forEach((key, value) {
      List<String?> newValue = [];
      int newKey = int.parse(key);
      for (final item in value) {
        if (item != null) {
          newValue.add(item.toString());
        }
      }
      convertedMap[newKey] = newValue;
    });
    return AnsweredResultModel(convertedMap);
  }
}

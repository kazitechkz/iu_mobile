import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_category_question_count_entity.dart';
import 'get_category_question_count_model_options_model.dart';

class GetCategoryQuestionCountModel extends GetCategoryQuestionCountEntity {
  GetCategoryQuestionCountModel(
      {required Map<int, GetCategoryQuestionCountModelOptionsModel>
          super.items});

  GetCategoryQuestionCountModel.fromMap(DataMap map)
      : this(items: handleData(map));

  factory GetCategoryQuestionCountModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryQuestionCountModel.fromMap(json);
  }

  static List<GetCategoryQuestionCountModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetCategoryQuestionCountModel.fromMap(map))
        .toList();
  }

  static Map<int, GetCategoryQuestionCountModelOptionsModel> handleData(
      DataMap map) {
    final rawData = map.cast<int, dynamic>();
    Map<int, GetCategoryQuestionCountModelOptionsModel> result = {};
    rawData.forEach((key, value) {
      result[key] = GetCategoryQuestionCountModelOptionsModel.fromMap(
          value.cast<String, dynamic>());
    });
    return result;
  }
}

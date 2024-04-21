import 'package:equatable/equatable.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_sub_category_question_count_entity.dart';
import 'get_sub_category_question_count_model_options_model.dart';

class GetSubCategoryQuestionCountModel
    extends GetSubCategoryQuestionCountEntity {
  const GetSubCategoryQuestionCountModel(
      {required Map<int, GetSubCategoryQuestionCountModelOptionsModel>
          super.items});

  GetSubCategoryQuestionCountModel.fromMap(DataMap map)
      : this(items: handleData(map));

  factory GetSubCategoryQuestionCountModel.fromJson(Map<String, dynamic> json) {
    return GetSubCategoryQuestionCountModel.fromMap(json);
  }

  static List<GetSubCategoryQuestionCountModelOptionsModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetSubCategoryQuestionCountModelOptionsModel.fromMap(map))
        .toList();
  }

  static Map<int, GetSubCategoryQuestionCountModelOptionsModel> handleData(
      DataMap map) {
    final rawData = map.cast<int, dynamic>();
    Map<int, GetSubCategoryQuestionCountModelOptionsModel> result = {};
    rawData.forEach((key, value) {
      result[key] = GetSubCategoryQuestionCountModelOptionsModel.fromMap(
          value.cast<String, dynamic>());
    });
    return result;
  }
}

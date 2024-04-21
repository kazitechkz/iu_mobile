import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_sub_category_question_count_model_options_entity.dart';

class GetSubCategoryQuestionCountModelOptionsModel
    extends GetSubCategoryQuestionCountModelOptionsEntity {
  const GetSubCategoryQuestionCountModelOptionsModel({
    required super.singleCount,
    required super.contextCount,
    required super.multipleCount,
  });

  GetSubCategoryQuestionCountModelOptionsModel.fromMap(DataMap map)
      : this(
          singleCount: map["single_count"],
          contextCount: map["context_count"],
          multipleCount: map["multiple_count"],
        );

  factory GetSubCategoryQuestionCountModelOptionsModel.fromJson(
      Map<String, dynamic> json) {
    return GetSubCategoryQuestionCountModelOptionsModel.fromMap(json);
  }

  static List<GetSubCategoryQuestionCountModelOptionsModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetSubCategoryQuestionCountModelOptionsModel.fromMap(map))
        .toList();
  }
}

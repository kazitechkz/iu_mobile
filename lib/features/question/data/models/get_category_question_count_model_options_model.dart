import 'package:equatable/equatable.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_category_question_count_model_options_entity.dart';

class GetCategoryQuestionCountModelOptionsModel
    extends GetCategoryQuestionCountModelOptionsEntity {
  const GetCategoryQuestionCountModelOptionsModel({
    required super.singleCount,
    required super.contextCount,
    required super.multipleCount,
  });

  GetCategoryQuestionCountModelOptionsModel.fromMap(DataMap map)
      : this(
          singleCount: map["single_count"],
          contextCount: map["context_count"],
          multipleCount: map["multiple_count"],
        );

  factory GetCategoryQuestionCountModelOptionsModel.fromJson(
      Map<String, dynamic> json) {
    return GetCategoryQuestionCountModelOptionsModel.fromMap(json);
  }

  static List<GetCategoryQuestionCountModelOptionsModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetCategoryQuestionCountModelOptionsModel.fromMap(map))
        .toList();
  }
}

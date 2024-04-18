import 'package:iu/features/stat/data/models/subject_sub_category_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/full_stat_entity.dart';

class FullStatModel extends FullStatEntity {
  const FullStatModel(
      {List<SubjectSubCategoryModel>? super.subjects,
      required super.count,
      super.average,
      super.min,
      super.max,
      super.questionQuantity});

  FullStatModel.fromMap(DataMap map)
      : this(
          subjects: map["subjects"]
              ? SubjectSubCategoryModel.fromMapList(map["subjects"])
              : null,
          count: map["count"],
          average: map["average"],
          min: map["min"],
          max: map["max"],
          questionQuantity: map["question_quantity"],
        );

  factory FullStatModel.fromJson(Map<String, dynamic> json) {
    return FullStatModel.fromMap(json);
  }

  static List<FullStatModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => FullStatModel.fromMap(map)).toList();
  }
}

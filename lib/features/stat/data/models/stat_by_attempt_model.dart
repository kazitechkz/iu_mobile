import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/features/attempt/data/models/question_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/stat_by_attempt_entity.dart';

class StatByAttemptModel extends StatByAttemptEntity {
  const StatByAttemptModel(
      {SubCategoryModel? super.subCategory,
      required super.subjectId,
      required super.right,
      required super.notRight,
      required super.total,
      List<QuestionModel>? super.questions});

  StatByAttemptModel.fromMap(DataMap map)
      : this(
          subCategory: map["sub_category"] != null
              ? SubCategoryModel.fromMap(map["sub_category"])
              : null,
          subjectId: map["subject_id"],
          right: map["right"],
          notRight: map["not_right"],
          total: map["total"],
          questions: map["questions"] != null
              ? QuestionModel.fromMapList(
                  map["questions"].cast<Map<String, dynamic>>())
              : null,
        );

  factory StatByAttemptModel.fromJson(Map<String, dynamic> json) {
    return StatByAttemptModel.fromMap(json);
  }

  static List<StatByAttemptModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => StatByAttemptModel.fromMap(map)).toList();
  }
}

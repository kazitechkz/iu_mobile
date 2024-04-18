import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/sub_category.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/stat_by_subject_entity.dart';

class StatBySubjectModel extends StatBySubjectEntity {
  const StatBySubjectModel(
      {SubCategoryModel? super.subCategory,
      required super.subjectId,
      required super.right,
      required super.notRight,
      required super.total});

  StatBySubjectModel.fromMap(DataMap map)
      : this(
          subCategory: map["sub_category"] != null
              ? SubCategoryModel.fromMap(map["sub_category"])
              : null,
          subjectId: map["subject_id"],
          right: map["right"],
          notRight: map["not_right"],
          total: map["total"],
        );

  factory StatBySubjectModel.fromJson(Map<String, dynamic> json) {
    return StatBySubjectModel.fromMap(json);
  }

  static List<StatBySubjectModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => StatBySubjectModel.fromMap(map)).toList();
  }
}

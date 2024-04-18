import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/sub_category.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/subject_stat_entity.dart';

class SubjectStatModel extends SubjectStatEntity {
  const SubjectStatModel({
    required super.right,
    required super.notRight,
    SubCategoryModel? super.subCategory,
  });

  SubjectStatModel.fromMap(DataMap map)
      : this(
          right: map["right"],
          notRight: map["notRight"],
          subCategory: map["sub_category"] != null
              ? SubCategoryModel.fromMap(map["sub_category"])
              : null,
        );

  factory SubjectStatModel.fromJson(Map<String, dynamic> json) {
    return SubjectStatModel.fromMap(json);
  }

  static List<SubjectStatModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubjectStatModel.fromMap(map)).toList();
  }
}

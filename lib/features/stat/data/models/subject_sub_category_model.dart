import 'package:equatable/equatable.dart';
import 'package:iu/features/stat/data/models/subject_stat_model.dart';
import 'package:iu/features/stat/domain/entities/subject_stat_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/subject_sub_category_entity.dart';

class SubjectSubCategoryModel extends SubjectSubCategoryEntity{
  SubjectSubCategoryModel({required Map<String, Map<String, SubjectStatModel?>> super.data});
  SubjectSubCategoryModel.fromMap(DataMap map)
      : this(
    data: map["data"]
  );

  factory SubjectSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubjectSubCategoryModel.fromMap(json);
  }

  static List<SubjectSubCategoryModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubjectSubCategoryModel.fromMap(map)).toList();
  }

}
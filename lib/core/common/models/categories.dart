import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/sub_category.dart';

import '../../utils/typedef.dart';

class CategoryEntity extends Equatable {
  final int id;
  final int subject_id;
  final String title_kk;
  final String title_ru;
  final SubCategoryEntity? sub_categories;
  final int s_questions_count;
  final int c_questions_count;
  final int m_questions_count;

  const CategoryEntity(
      {required this.id,
      required this.subject_id,
      required this.title_kk,
      required this.title_ru,
      this.sub_categories,
      required this.s_questions_count,
      required this.c_questions_count,
      required this.m_questions_count});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title_kk,
        title_ru,
        s_questions_count,
        c_questions_count,
        m_questions_count,
        sub_categories
      ];
}

class CategoryModel extends CategoryEntity {
  const CategoryModel(
      {required super.id,
      required super.subject_id,
      required super.title_kk,
      required super.title_ru,
      required super.s_questions_count,
      required super.c_questions_count,
      required super.m_questions_count});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel.fromMap(json);
  }

  CategoryModel.fromMap(DataMap map)
      : this(
            id: map['id'] as int,
            title_kk: map['title_kk'] as String,
            title_ru: map['title_ru'] ?? "" as String,
            subject_id: map['subject_id'] as int,
            s_questions_count: map['s_questions_count'] != null
                ? map['s_questions_count'] as int
                : 0,
            c_questions_count: map['c_questions_count'] != null
                ? map['c_questions_count'] as int
                : 0,
            m_questions_count: map['m_questions_count'] != null
                ? map['m_questions_count'] as int
                : 0);

  DataMap toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title_kk'] = title_kk;
    data['title_ru'] = title_ru;
    data['subject_id'] = subject_id;
    data['s_questions_count'] = s_questions_count;
    data['c_questions_count'] = c_questions_count;
    data['m_questions_count'] = m_questions_count;
    return data;
  }

  static List<CategoryModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => CategoryModel.fromMap(map)).toList();
  }
}

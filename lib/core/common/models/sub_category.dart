import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/categories.dart';
import 'package:iu/core/common/models/file_entity.dart';

import '../../utils/typedef.dart';

class SubCategoryEntity extends Equatable {
  final int id;
  final int category_id;
  final String title_kk;
  final String title_ru;
  final CategoryEntity? category;
  final int s_questions_count;
  final int c_questions_count;
  final int m_questions_count;

  const SubCategoryEntity({
    required this.id,
    required this.title_kk,
    required this.title_ru,
    required this.category_id,
    this.category,
    required this.s_questions_count,
    required this.c_questions_count,
    required this.m_questions_count
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title_kk, title_ru, category, category_id, s_questions_count, c_questions_count, m_questions_count];
}

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({
    required super.id, required super.title_kk, required super.title_ru, required super.category_id, super.category, required super.s_questions_count, required super.c_questions_count, required super.m_questions_count});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel.fromMap(json);
  }

  SubCategoryModel.fromMap(DataMap map)
      : this(
    id: map['id'] as int,
    title_kk: map['title_kk'] as String,
    title_ru: map['title_ru'] as String,
    category_id: map['category_id'] as int,
    category: map['category'] != null ? CategoryModel.fromJson(map['category']) : null,
    s_questions_count: map['s_questions_count'] as int,
    c_questions_count: map['c_questions_count'] as int,
    m_questions_count: map['m_questions_count'] as int
  );

  DataMap toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title_kk'] = title_kk;
    data['title_ru'] = title_ru;
    data['category_id'] = category_id;
    data['category'] = category;
    data['s_questions_count'] = s_questions_count;
    data['c_questions_count'] = c_questions_count;
    data['m_questions_count'] = m_questions_count;
    return data;
  }

  static List<SubCategoryModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubCategoryModel.fromMap(map)).toList();
  }
}
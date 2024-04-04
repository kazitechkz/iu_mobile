import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';

import '../../utils/typedef.dart';

class SubjectEntity extends Equatable {
  final int id;
  final String title_kk;
  final String title_ru;
  final int enable;
  final int is_compulsory;
  final int max_questions_quantity;
  final int questions_step;
  final String? created_at;
  final String? updated_at;
  final int? image_url;
  final FileEntity? image;

  const SubjectEntity({
    required this.id,
    required this.title_kk,
    required this.title_ru,
    required this.enable,
    required this.is_compulsory,
    required this.max_questions_quantity,
    required this.questions_step,
    this.created_at,
    this.updated_at,
    this.image_url,
    this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title_kk, title_ru, enable, is_compulsory, max_questions_quantity, questions_step, created_at, updated_at, image, image_url];
}

class SubjectModel extends SubjectEntity {
  const SubjectModel({
  required super.id,
    required super.title_kk,
    required super.title_ru,
    required super.enable,
    required super.is_compulsory,
    required super.max_questions_quantity,
    required super.questions_step,
    super.created_at,
    super.updated_at,
    super.image,
    super.image_url
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel.fromMap(json);
  }

  SubjectModel.fromMap(DataMap map)
      : this(
    id: map['id'] as int,
    title_kk: map['title_kk'] as String,
    title_ru: map['title_ru'] as String,
    enable: map['enable'] as int,
    is_compulsory: map['is_compulsory'] as int,
    max_questions_quantity: map['max_questions_quantity'] as int,
    questions_step: map['questions_step'] as int,
    image_url: map['image_url'] as int,
    created_at: map['created_at'] != null ? map['created_at'] as String : null,
    updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
    image: map["image"] != null ? FileModel.fromJson(map["image"]) : null,
  );

  static List<SubjectModel> fromJsonList(String jsonString) {
    final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<SubjectModel>((json) => SubjectModel.fromJson(json)).toList();
  }

  DataMap toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title_kk'] = title_kk;
    data['title_ru'] = title_ru;
    data['is_compulsory'] = is_compulsory;
    data['enable'] = enable;
    data['max_questions_quantity'] = max_questions_quantity;
    data['questions_step'] = questions_step;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['image'] = image;
    data['image_url'] = image_url;
    return data;
  }
}
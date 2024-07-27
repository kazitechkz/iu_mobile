import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/mixins/title_mixin.dart';
import '../../utils/typedef.dart';

class SubjectEntity extends Equatable with TitleMixin {
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
  List<Object?> get props =>
      [
        id,
        title_kk,
        title_ru,
        enable,
        is_compulsory,
        max_questions_quantity,
        questions_step,
        created_at,
        updated_at,
        image,
        image_url
      ];

  @override
  String? getTitleKk() => title_kk;

  @override
  String? getTitleRu() => title_ru;
}

class SubjectModel extends SubjectEntity {
  const SubjectModel({required super.id,
    required super.title_kk,
    required super.title_ru,
    required super.enable,
    required super.is_compulsory,
    required super.max_questions_quantity,
    required super.questions_step,
    super.created_at,
    super.updated_at,
    super.image,
    super.image_url});

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
    image_url: map['image_url'] != null ? map['image_url'] as int : null,
    created_at:
    map['created_at'] != null ? map['created_at'] as String : null,
    updated_at:
    map['updated_at'] != null ? map['updated_at'] as String : null,
    image: map["image"] != null ? FileModel.fromJson(map["image"]) : null,
  );

  static List<SubjectModel> fromJsonList(List<DataMap> mapList) {
    return mapList.map((e) => SubjectModel.fromJson(e)).toList();
  }

  static List<SubjectModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubjectModel.fromMap(map)).toList();
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

class LocalSubjectEntity extends Equatable with TitleMixin {
  final int id;
  final String titleKk;
  final String titleRu;
  final String imageUrl;
  final bool isSelected;
  final int period;

  const LocalSubjectEntity(this.id, this.titleKk, this.titleRu, this.imageUrl,
      this.isSelected, this.period);

  // Метод для копирования объекта с изменением поля isSelected
  LocalSubjectEntity copyWith({bool? isSelected, required int period}) {
    return LocalSubjectEntity(
        id,
        titleKk,
        titleRu,
        imageUrl,
        isSelected ?? this.isSelected,
        period
    );
  }

  @override
  List<Object?> get props =>
      [id, titleKk, titleRu, imageUrl, isSelected, period];

  @override
  String? getTitleKk() => titleKk;

  @override
  String? getTitleRu() => titleRu;
}

class SingleLocalSubjectEntity extends Equatable with TitleMixin {
  final String titleKk;
  final String titleRu;

  const SingleLocalSubjectEntity({required this.titleKk, required this.titleRu});

  @override
  List<Object> get props => [titleKk, titleRu];

  @override
  String? getTitleKk() => titleKk;

  @override
  String? getTitleRu() =>titleRu;
}

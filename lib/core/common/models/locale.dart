import 'package:equatable/equatable.dart';

import '../../utils/typedef.dart';

class LocaleEntity extends Equatable {
  const LocaleEntity(
      {required this.id,
      required this.title,
      required this.code,
      required this.isActive,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  final int id;
  final String title;
  final String code;
  final bool isActive;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props => [id, title, code, isActive];
}

class LocaleModel extends LocaleEntity {
  const LocaleModel(
      {required super.id,
      required super.title,
      required super.code,
      required super.isActive,
      super.deletedAt,
      super.createdAt,
      super.updatedAt});
  factory LocaleModel.fromJson(Map<String, dynamic> json) {
    return LocaleModel.fromMap(json);
  }

  LocaleModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          title: map["title"],
          code: map["code"],
          isActive: map["isActive"],
          deletedAt: map["deleted_at"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  static List<LocaleModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => LocaleModel.fromMap(map)).toList();
  }
}

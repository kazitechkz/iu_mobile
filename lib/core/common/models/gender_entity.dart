import 'package:equatable/equatable.dart';

import '../../utils/typedef.dart';

class GenderEntity extends Equatable{
  final int id;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const GenderEntity({required this.id, required this.titleRu, required this.titleKk, this.titleEn, this.createdAt,this.updatedAt});

  @override
  List<Object?> get props => [id];
}

class GenderModel extends GenderEntity{

  const GenderModel({required super.id, required super.titleRu, required super.titleKk, super.titleEn, super.createdAt,super.updatedAt});

  factory GenderModel.fromJson(Map<String,dynamic> json){
    return GenderModel.fromMap(json);
  }

  GenderModel.fromMap(DataMap map)
      : this(
      id: map['id'] as int,
      titleRu: map['title_ru'] as String,
      titleKk: map['title_kk'] as String,
      titleEn: map['title_en'] ? map['title_en'] as String : null,
      createdAt: map["created_at"] != null ? map["created_at"] as DateTime : null,
      updatedAt: map["updated_at"] != null ? map["updated_at"] as DateTime : null,
  );

  DataMap toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title_ru'] = titleRu;
    data['title_kk'] = titleKk;
    data['title_en'] = titleEn;
    data['created_at'] = createdAt !=null ? createdAt?.toIso8601String() : null;
    data['updated_at'] = updatedAt != null ? updatedAt?.toIso8601String() : null;
    return data;
  }


}
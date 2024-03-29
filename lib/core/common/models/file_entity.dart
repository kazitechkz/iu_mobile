import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../utils/typedef.dart';

class FileEntity extends Equatable{
  final int id;
  final String url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FileEntity({required this.id, required this.url, this.createdAt,this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [id,url];
}

class FileModel extends FileEntity{

  const FileModel({required super.id, required super.url, super.createdAt,super.updatedAt});

  factory FileModel.fromJson(Map<String,dynamic> json){
   return FileModel.fromMap(json);
  }

   FileModel.fromMap(DataMap map)
       : this(
               id: map['id'] as int,
               url:map["url"] as String,
               createdAt: map["created_at"] != null ? map["created_at"] as DateTime : null,
               updatedAt: map["updated_at"] != null ? map["updated_at"] as DateTime : null,
             );

  DataMap toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['url'] = url;
    data['created_at'] = createdAt !=null ? createdAt?.toIso8601String() : null;
    data['updated_at'] = updatedAt != null ? updatedAt?.toIso8601String() : null;
    return data;
  }



}
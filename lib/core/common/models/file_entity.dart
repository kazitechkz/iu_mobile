import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../utils/typedef.dart';

class FileEntity extends Equatable {
  final int id;
  final String url;

  const FileEntity({required this.id, required this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [id, url];
}

class FileModel extends FileEntity {
  const FileModel({
    required super.id,
    required super.url,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return FileModel.fromMap(json);
  }

  FileModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          url: map["url"] as String,
        );

  DataMap toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

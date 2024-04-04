import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/gender_entity.dart';

import '../../utils/typedef.dart';
import 'file_entity.dart';

class OrdinaryUserEntity extends Equatable{
  final int id;
  final String name;
  final String email;
  final String phone;
  final FileEntity? file;
  final GenderEntity? gender;
  final String? birth_date;

  const OrdinaryUserEntity({required this.id, required this.name,required this.email,required this.phone, this.file, this.gender, this.birth_date});

  @override
  List<Object?> get props => [id,name,email,phone];
}

class OrdinaryUserModel extends OrdinaryUserEntity{
  const OrdinaryUserModel({required super.id, required super.name,required super.email,required super.phone, FileModel? super.file , GenderModel? super.gender, super.birth_date});

  factory OrdinaryUserModel.fromJson(Map<String, dynamic> json) {
    return OrdinaryUserModel.fromMap(json);
  }

  OrdinaryUserModel.fromMap(DataMap map)
      : this(
    id: map["id"],
    name: map["name"],
    email: map["email"],
    phone: map["phone"],
    file: map["file"] != null ? FileModel.fromMap(map["file"]) : null,
    gender: map["gender"] != null ? GenderModel.fromMap(map["gender"]) : null,
    birth_date: map["birth_date"],

  );
}
import '../../../../core/common/models/file_entity.dart';
import '../../../../core/common/models/gender_entity.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/me_entity.dart';

class MeModel extends MeEntity{
  const MeModel(
      {required super.id,
        required super.name,
        required super.email,
        super.phone,
        required super.role,
        required super.balance,
        super.file,
        super.gender,
        super.birthDate,
        required super.isKundelik,
        required super.isGoogle,
        super.parentPhone,
        super.parentName
      });
  MeModel.fromMap(DataMap map)
      : this(
    id:map["id"],
    name:map["name"],
    email:map["email"],
    phone:map["phone"] != null ? map['phone'] as String : null,
    role:map["role"],
    balance:map["balance"],
    file:map["file"] !=null ? FileModel.fromMap(map["file"]) : null,
    gender:map["gender"] !=null ? GenderModel.fromMap(map["gender"]) : null,
    birthDate:map["birth_date"] != null ? map['birth_date'] as String : null,
    isKundelik:map["isKundelik"],
    isGoogle:map["isGoogle"],
    parentPhone:map["parent_phone"],
    parentName:map["parent_name"],

  );

  factory MeModel.fromJson(Map<String, dynamic> json) {
    return MeModel.fromMap(json);
  }

  static List<MeModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => MeModel.fromMap(map)).toList();
  }
}
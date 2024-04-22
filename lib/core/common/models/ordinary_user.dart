import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/gender_entity.dart';
import 'package:iu/features/attempt_setting/data/models/attempt_setting_result_model.dart';

import '../../../features/attempt_setting/data/models/attempt_setting_unt_result_model.dart';
import '../../../features/attempt_setting/domain/entities/attempt_setting_result_entity.dart';
import '../../../features/attempt_setting/domain/entities/attempt_setting_unt_result_entity.dart';
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

  static List<OrdinaryUserModel> fromJsonList(List<DataMap> mapList) {
    return mapList.map((e) => OrdinaryUserModel.fromJson(e)).toList();
  }
}

class OrdinaryUserForExamEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final FileEntity? file;
  final GenderEntity? gender;
  final String? birthDate;
  final AttemptSettingResultEntity? attemptSettingsResult;
  final AttemptSettingUntResultEntity? attemptSettingsUntResult;

  const OrdinaryUserForExamEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.file,
    this.gender,
    this.birthDate,
    this.attemptSettingsResult,
    this.attemptSettingsUntResult
  });

  @override
  List<Object?> get props => [id, name, email, phone, file, gender, birthDate, attemptSettingsResult, attemptSettingsUntResult];
}

class OrdinaryUserForExamModel extends OrdinaryUserForExamEntity {
  const OrdinaryUserForExamModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    super.attemptSettingsResult,
    super.attemptSettingsUntResult,
    super.birthDate,
    super.file,
    super.gender
  });

  factory OrdinaryUserForExamModel.fromJson(DataMap json) {
    return OrdinaryUserForExamModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        attemptSettingsResult: json['attempt_settings_result'] != null ? AttemptSettingResultModel.fromJson(json['attempt_settings_result']) : null,
        attemptSettingsUntResult: json['attempt_settings_unt_result'] != null ? AttemptSettingUntResultModel.fromJson(json['attempt_settings_unt_result']) : null,
        birthDate: json['birth_date'] != null ? json['birth_date'] as String : null,
        file: json['file'] != null ? FileModel.fromMap(json['file']) : null,
        gender: json['gender'] != null ? GenderModel.fromJson(json['gender']) : null
    );
  }

  static List<OrdinaryUserForExamModel> fromJsonList(List<DataMap> mapList) {
    return mapList.map((e) => OrdinaryUserForExamModel.fromJson(e)).toList();
  }

}
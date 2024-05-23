import 'dart:convert';

import 'package:iu/features/auth/domain/entities/auth_user_entity.dart';

import '../../../../core/common/models/file_entity.dart';
import '../../../../core/common/models/gender_entity.dart';
import '../../../../core/utils/typedef.dart';

class AuthUserModel extends AuthUserEntity {
  const AuthUserModel(
      {required super.id,
      required super.username,
      required super.name,
      required super.email,
      GenderModel? super.gender,
      FileModel? super.file,
      super.birthDate,
      super.phone,
      super.balance,
      required super.role,
      required super.isKundelik,
      super.parentPhone,
      super.parentName});

  AuthUserModel copyWith(
      {int? id,
      String? username,
      String? name,
      String? email,
      GenderModel? gender,
      FileModel? file,
      DateTime? birthDate,
      String? phone,
      int? balance,
      String? role,
      bool? isKundelik,
      String? parentPhone,
      String? parentName}) {
    return AuthUserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        gender: gender ?? this.gender as GenderModel,
        file: file ?? this.file as FileModel,
        birthDate: birthDate ?? this.birthDate,
        phone: phone ?? this.phone,
        balance: balance ?? this.balance,
        role: role ?? this.role,
        isKundelik: isKundelik ?? this.isKundelik,
        parentPhone: parentPhone ?? this.parentPhone,
        parentName: parentName ?? this.parentName);
  }

  factory AuthUserModel.fromJson(String json) {
    return AuthUserModel.fromMap(jsonDecode(json) as DataMap);
  }

  AuthUserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          username: map['username'] as String,
          name: map['name'] as String,
          email: map["email"] as String,
          gender: map["gender"] != null
              ? GenderModel.fromJson(map["gender"])
              : null,
          file: map["file"] != null ? FileModel.fromJson(map["file"]) : null,
          birthDate:
              map["birthDate"] != null ? map["birthDate"] as DateTime : null,
          phone: map["phone"] != null ? map['phone'] as String : null,
          balance: map["balance"] != null ? map["balance"] as int : null,
          role: map["role"] as String,
          isKundelik: map["isKundelik"] as bool,
          parentPhone:
              map["parentPhone"] != null ? map["parentPhone"] as String : null,
          parentName:
              map["parentName"] != null ? map["parentName"] as String : null,
        );

  DataMap toMap() {
    return {
      "id": id,
      "username": username,
      "name": name,
      "email": email,
      "birthDate": birthDate?.toIso8601String(),
      "phone": phone,
      "balance": balance,
      "role": role,
      "isKundelik": isKundelik,
      "parentPhone": parentPhone,
      "parentName": parentName,
    };
  }

  String toJson() => jsonEncode(toMap());
}

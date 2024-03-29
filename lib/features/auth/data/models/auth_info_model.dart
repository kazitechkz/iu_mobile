import 'dart:convert';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/auth_info_entity.dart';
import 'auth_user_model.dart';

class AuthInfoModel extends AuthInfoEntity {
  const AuthInfoModel(
      {required super.token,
        required super.role,
        required AuthUserModel super.user,
        required super.isFirst,
        required super.redirectURL});

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "role": role,
      "user": (user as AuthUserModel).toMap(),
      "isFirst": isFirst,
      "redirectUrl": redirectURL,
    };
  }

  factory AuthInfoModel.fromJson(String json) {
    DataMap data = jsonDecode(json) as DataMap;
    return AuthInfoModel.fromMap(data);
  }

  AuthInfoModel.fromMap(DataMap data)
      : this(
    token: data["token"],
    role: data["role"],
    user: AuthUserModel.fromMap(data["user"]),
    isFirst: data["isFirst"],
    redirectURL: data["redirectURL"],
  );
}
import 'package:iu/core/common/models/file_entity.dart';

import '../../../../core/common/models/gender_entity.dart';

class AuthUserEntity{
  final int id;
  final String username;
  final String name;
  final String email;
  final GenderEntity? gender;
  final FileEntity? file;
  final DateTime? birthDate;
  final String phone;
  final int? balance;
  final String role;
  final bool isKundelik;
  final String? parentPhone;
  final String? parentName;

  const AuthUserEntity({required this.id, required this.username, required this.name, required this.email, required this.gender, required this.file, required this.birthDate, required this.phone, required this.balance, required this.role, required this.isKundelik, required this.parentPhone, required this.parentName});

  @override
  List<Object?> get props => [id];
}

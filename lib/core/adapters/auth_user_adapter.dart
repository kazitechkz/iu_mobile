import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class AuthUserHive extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? username;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String? phone;

  @HiveField(5)
  final int? balance;

  @HiveField(6)
  final String? role;

  @HiveField(7)
  final bool? isKundelik;

  @HiveField(8)
  final String? parentPhone;

  @HiveField(9)
  final String? parentName;

  AuthUserHive({
    this.id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.balance,
    this.role,
    this.isKundelik,
    this.parentPhone,
    this.parentName,
  });
}

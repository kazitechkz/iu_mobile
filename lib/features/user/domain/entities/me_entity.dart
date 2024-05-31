import 'package:equatable/equatable.dart';
import '../../../../core/common/models/file_entity.dart';
import '../../../../core/common/models/gender_entity.dart';
import '../../../../core/common/models/subscription.dart';

class MeEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String role;
  final int balance;
  final FileEntity? file;
  final GenderEntity? gender;
  final Map<int, PlanEntity> subscriptions;
  final String? birthDate;
  final bool isKundelik;
  final bool isGoogle;
  final String? parentPhone;
  final String? parentName;

  const MeEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.role,
      required this.balance,
      this.file,
      this.gender,
      this.birthDate,
      required this.subscriptions,
      required this.isKundelik,
      required this.isGoogle,
      this.parentPhone,
      this.parentName});

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        role,
        balance,
        file,
        gender,
        birthDate,
        subscriptions,
        isKundelik,
        isGoogle,
        parentPhone,
        parentName
      ];
}

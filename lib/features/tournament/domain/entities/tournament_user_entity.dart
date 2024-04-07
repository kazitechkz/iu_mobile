import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/gender_entity.dart';

class TournamentUserEntity extends Equatable {
  final int id;
  final String username;
  final String name;
  final String phone;
  final String email;
  final FileEntity? file;
  final GenderEntity? gender;
  final String? birthDate;

  const TournamentUserEntity(
      {required this.id,
      required this.username,
      required this.name,
      required this.phone,
      required this.email,
      this.file,
      this.gender,
      this.birthDate});

  @override
  List<Object?> get props => [id, username, name, phone, email];
}

import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/features/tournament/domain/entities/tournament_user_entity.dart';

import '../../../../core/common/models/gender_entity.dart';
import '../../../../core/utils/typedef.dart';

class TournamentUserModel extends TournamentUserEntity {
  const TournamentUserModel(
      {required super.id,
      required super.username,
      required super.name,
      required super.phone,
      required super.email,
      FileModel? super.file,
      GenderModel? super.gender,
      super.birthDate});

  TournamentUserModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          username: map["username"],
          name: map["name"],
          phone: map["phone"],
          email: map["email"],
          file: map["file"] != null ? FileModel.fromMap(map["file"]) : null,
          gender:
              map["gender"] != null ? GenderModel.fromMap(map["gender"]) : null,
          birthDate: map["birth_date"],
        );

  factory TournamentUserModel.fromJson(Map<String, dynamic> json) {
    return TournamentUserModel.fromMap(json);
  }

  static List<TournamentUserModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TournamentUserModel.fromMap(map)).toList();
  }
}

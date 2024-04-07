import 'dart:io';

import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_model.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';

import '../../../../core/common/models/file_entity.dart';
import '../../../../core/utils/typedef.dart';

class TournamentModel extends TournamentEntity {
  const TournamentModel({
    required super.id,
    required super.subjectId,
    required super.titleRu,
    required super.titleKk,
    super.titleEn,
    required super.ruleRu,
    required super.ruleKk,
    super.ruleEn,
    required super.descriptionRu,
    required super.descriptionKk,
    super.descriptionEn,
    required super.price,
    required super.currency,
    super.poster,
    required super.status,
    required super.startAt,
    required super.endAt,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    List<LocaleModel>? super.locales,
    SubjectModel? super.subject,
    List<SubTournamentModel>? super.subTournaments,
    FileModel? super.file,
  });

  TournamentModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          subjectId: map["subject_id"],
          titleRu: map["title_ru"],
          titleKk: map["title_kk"],
          titleEn: map["title_en"],
          ruleRu: map["rule_ru"],
          ruleKk: map["rule_kk"],
          ruleEn: map["rule_en"],
          descriptionRu: map["description_ru"],
          descriptionKk: map["description_kk"],
          descriptionEn: map["description_en"],
          price: map["price"],
          currency: map["currency"],
          poster: map["poster"],
          status: map["status"],
          startAt: map["start_at"],
          endAt: map["end_at"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
          locales: map["locales"] != null
              ? LocaleModel.fromMapList(
                  map["locales"].cast<Map<String, dynamic>>())
              : null,
          subject: map["subject"] != null
              ? SubjectModel.fromMap(map["subject"])
              : null,
          subTournaments: map["sub_tournaments"] != null
              ? SubTournamentModel.fromMapList(
                  map["sub_tournaments"].cast<Map<String, dynamic>>())
              : null,
          file: map["file"] != null ? FileModel.fromMap(map["file"]) : null,
        );

  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel.fromMap(json);
  }

  static List<TournamentModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TournamentModel.fromMap(map)).toList();
  }
}

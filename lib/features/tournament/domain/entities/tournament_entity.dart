import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';

class TournamentEntity extends Equatable {
  final int id;
  final int subjectId;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final String ruleRu;
  final String ruleKk;
  final String? ruleEn;
  final String descriptionRu;
  final String descriptionKk;
  final String? descriptionEn;
  final int price;
  final String currency;
  final int? poster;
  final int status;
  final String startAt;
  final String endAt;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<LocaleEntity>? locales;
  final SubjectEntity? subject;
  final List<SubTournamentEntity>? subTournaments;
  final FileEntity? file;

  const TournamentEntity({
    required this.id,
    required this.subjectId,
    required this.titleRu,
    required this.titleKk,
    this.titleEn,
    required this.ruleRu,
    required this.ruleKk,
    this.ruleEn,
    required this.descriptionRu,
    required this.descriptionKk,
    this.descriptionEn,
    required this.price,
    required this.currency,
    this.poster,
    required this.status,
    required this.startAt,
    required this.endAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.locales,
    this.subject,
    this.subTournaments,
    this.file,
  });

  @override
  List<Object?> get props => [
        id,
        subjectId,
        titleRu,
        titleEn,
        titleKk,
        ruleRu,
        ruleKk,
        ruleEn,
        descriptionRu,
        descriptionKk,
        descriptionEn,
        price,
        currency,
        poster,
        status,
        startAt,
        endAt,
      ];
}

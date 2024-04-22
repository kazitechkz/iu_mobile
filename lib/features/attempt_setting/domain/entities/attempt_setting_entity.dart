import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_result_entity.dart';

class AttemptSettingEntity extends Equatable {
  final int id;
  final int subjectId;
  final String? promoCode;
  final int? classId;
  final List<OrdinaryUserForExamEntity>? users;
  final OrdinaryUserForExamEntity? attemptUsers;
  final int? ownerId;
  final String settings;
  final int localeId;
  final int time;
  final String? hiddenFields;
  final String createdAt;
  final String updatedAt;
  final LocaleEntity? locale;
  final OrdinaryUserEntity? owner;
  final SubjectEntity? subject;
  final List<AttemptSettingResultEntity>? attemptSettingsResults;

  const AttemptSettingEntity({
    required this.id,
    required this.subjectId,
    this.promoCode,
    this.classId,
    this.users,
    this.attemptUsers,
    this.ownerId,
    required this.settings,
    required this.localeId,
    required this.time,
    this.hiddenFields,
    required this.createdAt,
    required this.updatedAt,
    this.locale,
    this.owner,
    this.subject,
    this.attemptSettingsResults
  });


  @override
  List<Object?> get props => [id, subjectId, promoCode, classId, users, attemptUsers, ownerId, settings, localeId, time, hiddenFields, createdAt, updatedAt, locale, owner, subject, attemptSettingsResults];
}
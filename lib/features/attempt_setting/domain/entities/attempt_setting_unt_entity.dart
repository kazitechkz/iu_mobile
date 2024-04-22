import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_unt_result_entity.dart';

class AttemptSettingUntEntity extends Equatable {
  final int id;
  final String? promoCode;
  final int localeId;
  final int senderId;
  final int? classId;
  final List<int>? users;
  final List<SubjectEntity>? subjects;
  final String? settings;
  final int time;
  final String hiddenFields;
  final String createdAt;
  final String? updatedAt;
  final LocaleEntity? locale;
  final OrdinaryUserEntity? sender;
  final List<AttemptSettingUntResultEntity>? attemptSettingsResultsUnt;
  final OrdinaryUserForExamEntity? attemptUsers;

  const AttemptSettingUntEntity({
    required this.id,
    this.promoCode,
    required this.localeId,
    required this.senderId,
    this.classId,
    this.users,
    this.subjects,
    required this.settings,
    required this.time,
    required this.hiddenFields,
    required this.createdAt,
    this.updatedAt,
    this.locale,
    this.sender,
    this.attemptSettingsResultsUnt,
    this.attemptUsers
  });

  @override
  List<Object?> get props => [id, promoCode, localeId, senderId, classId, users, subjects, settings, time, hiddenFields, createdAt, updatedAt, locale, sender, attemptSettingsResultsUnt, attemptUsers];
}
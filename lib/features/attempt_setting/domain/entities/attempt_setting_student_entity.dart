import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';

class AttemptSettingStudentEntity extends Equatable {
  final int id;
  final String promoCode;
  final int? classId;
  final String settings;
  final int localeId;
  final int time;
  final String? hiddenFields;
  final int point;
  final String createdAt;
  final String updatedAt;
  final int subjectId;
  final int ownerId;
  final LocaleEntity? locale;
  final List<OrdinaryUserEntity>? users;
  final OrdinaryUserEntity? owner;
  final SubjectEntity? subject;

  const AttemptSettingStudentEntity({
    required this.id,
    required this.promoCode,
    this.classId,
    required this.settings,
    required this.localeId,
    required this.time,
    this.hiddenFields,
    required this.point,
    required this.createdAt,
    required this.updatedAt,
    required this.subjectId,
    required this.ownerId,
    required this.locale,
    required this.users,
    required this.owner,
    required this.subject
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    promoCode,
    classId,
    settings,
    localeId,
    time,
    hiddenFields,
    point,
    createdAt,
    updatedAt,
    subjectId,
    ownerId,
    locale,
    users,
    owner,
    subject
  ];
}
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/domain/entities/attempt_type_entity.dart';

class AttemptEntity extends Equatable {
  final int id;
  final int typeId;
  final int userId;
  final int localeId;
  final String startAt;
  final String? endAt;
  final int maxPoints;
  final int points;
  final int time;
  final int timeLeft;
  final AttemptTypeEntity? attemptType;
  final List<SubjectEntity>? subjects;
  final OrdinaryUserEntity? user;
  final LocaleEntity? locale;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const AttemptEntity({
    required this.id,
    required this.typeId,
    required this.userId,
    required this.localeId,
    required this.startAt,
    this.endAt,
    required this.maxPoints,
    required this.points,
    required this.time,
    required this.timeLeft,
    this.attemptType,
    this.subjects,
    this.user,
    this.locale,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        typeId,
        userId,
        localeId,
        startAt,
        maxPoints,
        points,
        time,
        timeLeft
      ];
}

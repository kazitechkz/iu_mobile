import 'package:equatable/equatable.dart';

class TournamentStepEntity extends Equatable {
  final int id;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final int maxParticipants;
  final bool isFirst;
  final bool isLast;
  final int? prevId;
  final int? nextId;
  final int order;
  final bool isPlayoff;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const TournamentStepEntity({
    required this.id,
    required this.titleRu,
    required this.titleKk,
    this.titleEn,
    required this.maxParticipants,
    required this.isFirst,
    required this.isLast,
    this.prevId,
    this.nextId,
    required this.order,
    required this.isPlayoff,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        titleRu,
        titleKk,
        maxParticipants,
        isFirst,
        isLast,
        order,
        isPlayoff
      ];
}

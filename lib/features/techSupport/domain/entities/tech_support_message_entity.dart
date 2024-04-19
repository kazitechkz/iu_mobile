import 'package:equatable/equatable.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_file_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_ticket_entity.dart';

import '../../../../core/common/models/ordinary_user.dart';

class TechSupportMessageEntity extends Equatable {
  final int id;
  final int ticketId;
  final int userId;
  final String message;
  final TechSupportTicketEntity? techSupportTicket;
  final OrdinaryUserEntity? user;
  final List<TechSupportFileEntity>? techSupportFiles;
  final String? createdAt;
  final String? updatedAt;

  const TechSupportMessageEntity(
      {required this.id,
      required this.ticketId,
      required this.userId,
      required this.message,
      this.techSupportTicket,
      this.user,
      this.techSupportFiles,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        ticketId,
        userId,
        message,
        techSupportTicket,
        user,
        techSupportFiles,
        createdAt,
        updatedAt
      ];
}

import 'package:equatable/equatable.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_category_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_type_entity.dart';

import '../../../../core/common/models/ordinary_user.dart';

class TechSupportTicketEntity extends Equatable {
  final int id;
  final int typeId;
  final int categoryId;
  final String title;
  final int userId;
  final bool? isClosed;
  final bool? isResolved;
  final bool? isAnswered;
  final int? techSupportMessagesCount;
  final TechSupportCategoryEntity? techSupportCategory;
  final TechSupportTypeEntity? techSupportType;
  final OrdinaryUserEntity? user;
  final String? createdAt;
  final String? updatedAt;

  const TechSupportTicketEntity(
      {required this.id,
      required this.typeId,
      required this.categoryId,
      required this.title,
      required this.userId,
      this.isClosed,
      this.isResolved,
      this.isAnswered,
      this.techSupportMessagesCount,
      this.techSupportCategory,
      this.techSupportType,
      this.user,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        typeId,
        categoryId,
        title,
        userId,
        isClosed,
        isResolved,
        isAnswered,
        techSupportMessagesCount,
        techSupportCategory,
        techSupportType,
        user,
        createdAt,
        updatedAt
      ];
}

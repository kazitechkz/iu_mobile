import 'package:equatable/equatable.dart';
import 'package:iu/features/techSupport/data/models/tech_support_category_model.dart';
import 'package:iu/features/techSupport/data/models/tech_support_type_model.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_category_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_type_entity.dart';

import '../../../../core/common/models/ordinary_user.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tech_support_ticket_entity.dart';

class TechSupportTicketModel extends TechSupportTicketEntity {
  const TechSupportTicketModel(
      {required super.id,
      required super.typeId,
      required super.categoryId,
      required super.title,
      required super.userId,
      required super.isClosed,
      required super.isResolved,
      required super.isAnswered,
      super.techSupportMessagesCount,
      TechSupportCategoryModel? super.techSupportCategory,
      TechSupportTypeModel? super.techSupportType,
      OrdinaryUserModel? super.user,
      super.createdAt,
      super.updatedAt});

  TechSupportTicketModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          typeId: map["type_id"],
          categoryId: map["category_id"],
          title: map["title"],
          userId: map["user_id"],
          isClosed: map["is_closed"],
          isResolved: map["is_resolved"],
          isAnswered: map["is_answered"],
          techSupportMessagesCount: map["tech_support_messages_count"],
          techSupportCategory: map["tech_support_category"] != null
              ? TechSupportCategoryModel.fromMap(map["tech_support_category"])
              : null,
          techSupportType: map["tech_support_type"] != null
              ? TechSupportTypeModel.fromMap(map["tech_support_type"])
              : null,
          user: map["user"] != null
              ? OrdinaryUserModel.fromMap(map["user"])
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory TechSupportTicketModel.fromJson(Map<String, dynamic> json) {
    return TechSupportTicketModel.fromMap(json);
  }

  static List<TechSupportTicketModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TechSupportTicketModel.fromMap(map)).toList();
  }
}

import 'package:iu/features/techSupport/data/models/tech_support_file_model.dart';
import 'package:iu/features/techSupport/data/models/tech_support_ticket_model.dart';
import '../../../../core/common/models/ordinary_user.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tech_support_message_entity.dart';

class TechSupportMessageModel extends TechSupportMessageEntity {
  const TechSupportMessageModel(
      {required super.id,
      required super.ticketId,
      required super.userId,
      required super.message,
      TechSupportTicketModel? super.techSupportTicket,
      OrdinaryUserModel? super.user,
      List<TechSupportFileModel>? super.techSupportFiles,
      super.createdAt,
      super.updatedAt});

  TechSupportMessageModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          ticketId: map["ticket_id"],
          userId: map["user_id"],
          message: map["message"],
          techSupportTicket: map["tech_support_ticket"] != null
              ? TechSupportTicketModel.fromMap(map["tech_support_ticket"])
              : null,
          user: map["user"] != null
              ? OrdinaryUserModel.fromMap(map["user"])
              : null,
          techSupportFiles: map["tech_support_files"] != null
              ? TechSupportFileModel.fromMapList(
                  map["tech_support_files"].cast<Map<String, dynamic>>())
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory TechSupportMessageModel.fromJson(Map<String, dynamic> json) {
    return TechSupportMessageModel.fromMap(json);
  }

  static List<TechSupportMessageModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TechSupportMessageModel.fromMap(map)).toList();
  }
}

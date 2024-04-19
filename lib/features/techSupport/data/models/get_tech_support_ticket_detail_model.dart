import 'package:iu/features/techSupport/data/models/tech_support_message_model.dart';
import 'package:iu/features/techSupport/data/models/tech_support_ticket_model.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_tech_support_ticket_detail_entity.dart';

class GetTechSupportTicketDetailModel extends GetTechSupportTicketDetailEntity {
  const GetTechSupportTicketDetailModel({
    required TechSupportTicketModel super.ticket,
    required PaginationData<List<TechSupportMessageModel>> super.messages,
  });

  GetTechSupportTicketDetailModel.fromMap(DataMap map)
      : this(
            ticket: TechSupportTicketModel.fromMap(map["ticket"]),
            messages: handleData(map));

  factory GetTechSupportTicketDetailModel.fromJson(Map<String, dynamic> json) {
    return GetTechSupportTicketDetailModel.fromMap(json);
  }

  static List<GetTechSupportTicketDetailModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetTechSupportTicketDetailModel.fromMap(map))
        .toList();
  }

  static PaginationData<List<TechSupportMessageModel>> handleData(DataMap map) {
    PaginationData paginationData = PaginationData.fromMap(map["messages"]);
    List<TechSupportMessageModel> data = TechSupportMessageModel.fromMapList(
        paginationData.data.cast<Map<String, dynamic>>());
    return PaginationData.fromType(paginationData, data);
  }
}

import 'package:dio/dio.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/get_tech_support_ticket_detail_entity.dart';
import '../../domain/entities/tech_support_category_entity.dart';
import '../../domain/entities/tech_support_message_entity.dart';
import '../../domain/entities/tech_support_ticket_entity.dart';
import '../../domain/entities/tech_support_type_entity.dart';
import '../../domain/parameters/close_tech_support_ticket_parameter.dart';
import '../../domain/parameters/create_tech_support_message_parameter.dart';
import '../../domain/parameters/create_tech_support_ticket_parameter.dart';
import '../../domain/parameters/get_my_tech_support_tickets_parameter.dart';
import '../../domain/parameters/get_tech_support_ticket_detail_parameter.dart';
import '../models/get_tech_support_ticket_detail_model.dart';
import '../models/tech_support_category_model.dart';
import '../models/tech_support_message_model.dart';
import '../models/tech_support_ticket_model.dart';
import '../models/tech_support_type_model.dart';

abstract class TechSupportDataSourceInterface{
  Future<TechSupportTicketEntity> closeTechSupportTicketDS(CloseTechSupportTicketParameter parameter);
  Future<TechSupportMessageEntity> createTechSupportMessageDS(CreateTechSupportMessageParameter parameter);
  Future<TechSupportTicketEntity> createTechSupportTicketDS(CreateTechSupportTicketParameter parameter);
  Future<PaginationData<List<TechSupportTicketEntity>>> getMyTechSupportTicketsDS(GetMyTechSupportTicketsParameter parameter);
  Future<List<TechSupportCategoryEntity>> getTechSupportCategoriesDS();
  Future<GetTechSupportTicketDetailModel> getTechSupportTicketDetailDS(GetTechSupportTicketDetailParameter parameter);
  Future<List<TechSupportTypeEntity>> getTechSupportTypesDS();
}

class TechSupportDataSourceImpl extends TechSupportDataSourceInterface{
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<TechSupportTicketEntity> closeTechSupportTicketDS(CloseTechSupportTicketParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.closeTechSupportTicket,data:parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = TechSupportTicketModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<TechSupportMessageEntity> createTechSupportMessageDS(CreateTechSupportMessageParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.createTechSupportMessage,data:parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = TechSupportMessageModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<TechSupportTicketEntity> createTechSupportTicketDS(CreateTechSupportTicketParameter parameter) async {
    try {
      final response = await HttpUtil().post(ApiConstant.createTechSupportTicket,data:parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = TechSupportTicketModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<PaginationData<List<TechSupportTicketEntity>>> getMyTechSupportTicketsDS(GetMyTechSupportTicketsParameter parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getMyTechSupportTickets,data:parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final paginationData = PaginationData.fromJson(responseData.data);
      List<TechSupportTicketModel> data = TechSupportTicketModel.fromMapList(paginationData.data.cast<Map<String, dynamic>>());
      final result = PaginationData.fromType(paginationData,data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<TechSupportCategoryEntity>> getTechSupportCategoriesDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.getTechSupportCategories);
      final responseData = ResponseData.fromJson(response);
      List<TechSupportCategoryModel> result = TechSupportCategoryModel.fromMapList(responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<GetTechSupportTicketDetailModel> getTechSupportTicketDetailDS(GetTechSupportTicketDetailParameter parameter) async {
    try {
      final response = await HttpUtil().get(ApiConstant.getTechSupportTicketDetail + parameter.ticket_id.toString(), data:parameter.toMap());
      final responseData =ResponseData.fromJson(response);
      GetTechSupportTicketDetailModel result = GetTechSupportTicketDetailModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<TechSupportTypeEntity>> getTechSupportTypesDS() async {
    try {
      final response = await HttpUtil().get(ApiConstant.getTechSupportTypes);
      final responseData = ResponseData.fromJson(response);
      List<TechSupportTypeModel> result = TechSupportTypeModel.fromMapList(responseData.data.cast<Map<String, dynamic>>());
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

}
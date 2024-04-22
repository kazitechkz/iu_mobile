import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/techSupport/domain/entities/get_tech_support_ticket_detail_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_category_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_message_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_ticket_entity.dart';
import 'package:iu/features/techSupport/domain/entities/tech_support_type_entity.dart';
import 'package:iu/features/techSupport/domain/parameters/close_tech_support_ticket_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/create_tech_support_message_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/create_tech_support_ticket_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/get_my_tech_support_tickets_parameter.dart';
import 'package:iu/features/techSupport/domain/parameters/get_tech_support_ticket_detail_parameter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/interface/tech_support_interface.dart';
import '../datasources/tech_support_datasource.dart';

class TechSupportRepository implements TechSupportInterface {
  final TechSupportDataSourceInterface _techSupportInterface;

  const TechSupportRepository(this._techSupportInterface);

  @override
  ResultFuture<TechSupportTicketEntity> closeTechSupportTicket(
      CloseTechSupportTicketParameter parameter) async {
    try {
      final result =
          await _techSupportInterface.closeTechSupportTicketDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<TechSupportMessageEntity> createTechSupportMessage(
      CreateTechSupportMessageParameter parameter) async {
    try {
      final result =
          await _techSupportInterface.createTechSupportMessageDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<TechSupportTicketEntity> createTechSupportTicket(
      CreateTechSupportTicketParameter parameter) async {
    try {
      final result =
          await _techSupportInterface.createTechSupportTicketDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<PaginationData<List<TechSupportTicketEntity>>>
      getMyTechSupportTickets(
          GetMyTechSupportTicketsParameter parameter) async {
    try {
      final result =
          await _techSupportInterface.getMyTechSupportTicketsDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<List<TechSupportCategoryEntity>>
      getTechSupportCategories() async {
    try {
      final result = await _techSupportInterface.getTechSupportCategoriesDS();
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<GetTechSupportTicketDetailEntity>
      getTechSupportTicketDetail(
          GetTechSupportTicketDetailParameter parameter) async {
    try {
      final result =
          await _techSupportInterface.getTechSupportTicketDetailDS(parameter);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

  @override
  ResultFuture<List<TechSupportTypeEntity>> getTechSupportTypes() async {
    try {
      final result = await _techSupportInterface.getTechSupportTypesDS();
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }
}

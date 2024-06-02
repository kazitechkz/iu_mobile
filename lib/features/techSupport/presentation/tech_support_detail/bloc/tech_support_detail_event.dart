part of 'tech_support_detail_bloc.dart';

@immutable
sealed class TechSupportDetailEvent {}

class TechSupportDetailGetByIdEvent extends TechSupportDetailEvent {
  final GetTechSupportTicketDetailParameter parameter;
  TechSupportDetailGetByIdEvent({required this.parameter});
}

class TechSupportDetailCloseEvent extends TechSupportDetailEvent {
  final CloseTechSupportTicketParameter parameter;
  TechSupportDetailCloseEvent(this.parameter);
}

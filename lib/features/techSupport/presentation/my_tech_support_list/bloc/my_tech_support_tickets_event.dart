part of 'my_tech_support_tickets_bloc.dart';

@immutable
sealed class MyTechSupportTicketsEvent {}

class MyTechSupportGetTicketsEvent extends MyTechSupportTicketsEvent {
  final GetMyTechSupportTicketsParameter params;
  MyTechSupportGetTicketsEvent(this.params);
}

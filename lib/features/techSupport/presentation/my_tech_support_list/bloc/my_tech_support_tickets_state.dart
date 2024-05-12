part of 'my_tech_support_tickets_bloc.dart';

@immutable
sealed class MyTechSupportTicketsState extends Equatable {}

final class MyTechSupportTicketsInitialState extends MyTechSupportTicketsState {
  @override
  List<Object?> get props => [];
}

final class MyTechSupportTicketsLoadingState extends MyTechSupportTicketsState {
  @override
  List<Object?> get props => [];
}

final class MyTechSupportTicketsFailedState extends MyTechSupportTicketsState {
  final FailureData failureData;
  MyTechSupportTicketsFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class MyTechSupportTicketsSuccessState extends MyTechSupportTicketsState {
  final PaginationData<List<TechSupportTicketEntity>> ticketsData;
  final List<TechSupportTicketEntity> tickets;
  MyTechSupportTicketsSuccessState(
      {required this.ticketsData, required this.tickets});

  MyTechSupportTicketsSuccessState copyWith(
      {PaginationData<List<TechSupportTicketEntity>>? TicketsData,
      List<TechSupportTicketEntity>? Tickets}) {
    return MyTechSupportTicketsSuccessState(
        tickets: Tickets ?? tickets, ticketsData: TicketsData ?? ticketsData);
  }

  @override
  List<Object?> get props => [ticketsData, tickets];
}

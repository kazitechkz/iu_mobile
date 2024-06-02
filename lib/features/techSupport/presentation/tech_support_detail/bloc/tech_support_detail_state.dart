part of 'tech_support_detail_bloc.dart';

@immutable
sealed class TechSupportDetailState extends Equatable {}

final class TechSupportDetailInitialState extends TechSupportDetailState {
  @override
  List<Object?> get props => [];
}

final class TechSupportDetailLoadingState extends TechSupportDetailState {
  @override
  List<Object?> get props => [];
}

final class TechSupportDetailClosedState extends TechSupportDetailState {
  @override
  List<Object?> get props => [];
}

final class TechSupportDetailFailedState extends TechSupportDetailState {
  final FailureData failureData;
  TechSupportDetailFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class TechSupportDetailSuccessState extends TechSupportDetailState {
  final GetTechSupportTicketDetailEntity ticketDetailEntity;
  final List<TechSupportMessageEntity> messages;
  final TechSupportTicketEntity ticket;
  TechSupportDetailSuccessState(
      {required this.ticket,
      required this.ticketDetailEntity,
      required this.messages});

  TechSupportDetailSuccessState copyWith({
    GetTechSupportTicketDetailEntity? TicketDetailEntity,
    List<TechSupportMessageEntity>? Messages,
    TechSupportTicketEntity? Ticket,
  }) {
    return TechSupportDetailSuccessState(
        ticket: Ticket ?? ticket,
        ticketDetailEntity: TicketDetailEntity ?? ticketDetailEntity,
        messages: Messages ?? messages);
  }

  @override
  List<Object?> get props => [messages, ticketDetailEntity, ticket];
}

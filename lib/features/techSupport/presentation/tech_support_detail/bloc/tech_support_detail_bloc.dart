import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/get_tech_support_ticket_detail_entity.dart';
import '../../../domain/entities/tech_support_message_entity.dart';
import '../../../domain/entities/tech_support_ticket_entity.dart';
import '../../../domain/parameters/close_tech_support_ticket_parameter.dart';
import '../../../domain/parameters/get_tech_support_ticket_detail_parameter.dart';
import '../../../domain/use_cases/close_tech_support_ticket_case.dart';
import '../../../domain/use_cases/get_tech_support_ticket_detail_case.dart';

part 'tech_support_detail_event.dart';

part 'tech_support_detail_state.dart';

class TechSupportDetailBloc
    extends Bloc<TechSupportDetailEvent, TechSupportDetailState> {
  TechSupportDetailBloc(
      {required GetTechSupportTicketDetailCase getTechSupportTicketDetailCase,
      required CloseTechSupportTicketCase closeTechSupportTicketCase})
      : _getTechSupportTicketDetailCase = getTechSupportTicketDetailCase,
        _closeTechSupportTicketCase = closeTechSupportTicketCase,
        super(TechSupportDetailInitialState()) {
    on<TechSupportDetailGetByIdEvent>(_handleTechSupportDetailGetByIdEvent);
    on<TechSupportDetailCloseEvent>(_handleTechSupportDetailCloseEvent);
  }

  final GetTechSupportTicketDetailCase _getTechSupportTicketDetailCase;
  final CloseTechSupportTicketCase _closeTechSupportTicketCase;

  Future<void> _handleTechSupportDetailGetByIdEvent(
      TechSupportDetailGetByIdEvent event,
      Emitter<TechSupportDetailState> emit) async {
    if (state is TechSupportDetailSuccessState) {
      final currentState = state as TechSupportDetailSuccessState;
      final oldMessages = currentState.messages;
      emit(TechSupportDetailLoadingState());
      final result = await _getTechSupportTicketDetailCase(event.parameter);
      result.fold(
          (l) =>
              emit(TechSupportDetailFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(
              Ticket: currentState.ticket,
              TicketDetailEntity: r,
              Messages: [...oldMessages, ...r.messages.data])));
    } else {
      emit(TechSupportDetailLoadingState());
      final result = await _getTechSupportTicketDetailCase(event.parameter);
      result.fold(
          (l) =>
              emit(TechSupportDetailFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(TechSupportDetailSuccessState(
              ticket: r.ticket,
              ticketDetailEntity: r,
              messages: r.messages.data)));
    }
  }

  Future<void> _handleTechSupportDetailCloseEvent(
      TechSupportDetailCloseEvent event,
      Emitter<TechSupportDetailState> emit) async {
    emit(TechSupportDetailLoadingState());
    final result = await _closeTechSupportTicketCase(event.parameter);
    result.fold(
        (l) =>
            emit(TechSupportDetailFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(TechSupportDetailClosedState()));
  }
}

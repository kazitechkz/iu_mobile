import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';
import '../../../../../core/common/models/pagination_data.dart';
import '../../../domain/entities/tech_support_ticket_entity.dart';
import '../../../domain/parameters/get_my_tech_support_tickets_parameter.dart';
import '../../../domain/use_cases/get_my_tech_support_tickets_case.dart';
part 'my_tech_support_tickets_event.dart';

part 'my_tech_support_tickets_state.dart';

class MyTechSupportTicketsBloc
    extends Bloc<MyTechSupportTicketsEvent, MyTechSupportTicketsState> {
  MyTechSupportTicketsBloc(
      {required GetMyTechSupportTicketsCase getMyTechSupportTicketsCase})
      : _getMyTechSupportTicketsCase = getMyTechSupportTicketsCase,
        super(MyTechSupportTicketsInitialState()) {
    on<MyTechSupportGetTicketsEvent>(_handleMyTechSupportGetTicketsEvent);
  }

  final GetMyTechSupportTicketsCase _getMyTechSupportTicketsCase;

  Future<void> _handleMyTechSupportGetTicketsEvent(
      MyTechSupportGetTicketsEvent event,
      Emitter<MyTechSupportTicketsState> emit) async {
    emit(MyTechSupportTicketsLoadingState());
    final result = await _getMyTechSupportTicketsCase(event.params);
    result.fold(
        (l) => emit(
            MyTechSupportTicketsFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(
            MyTechSupportTicketsSuccessState(ticketsData: r, tickets: r.data)));
  }
}

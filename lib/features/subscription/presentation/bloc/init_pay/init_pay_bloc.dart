import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/subscription/domain/entities/paybox_entity.dart';
import 'package:iu/features/subscription/domain/parameters/paybox_parameters.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/use_cases/paybox_usecase.dart';

part 'init_pay_event.dart';
part 'init_pay_state.dart';

class InitPayBloc extends Bloc<InitPayEvent, InitPayState> {
  final PayBoxUseCase _payBoxUseCase;
  InitPayBloc({required PayBoxUseCase useCase}) : _payBoxUseCase = useCase, super(InitPayInitial()) {
    on<GetInitPayResultEvent>(_handleInitPay);
  }

  Future<void> _handleInitPay(GetInitPayResultEvent event, Emitter<InitPayState> emit) async {
    emit(GetInitPayLoading());
    final result = await _payBoxUseCase(event.params);
    result.fold((l) => emit(GetInitPayResultError(FailureData.fromApiFailure(l))), (r) => emit(GetInitPayResultLoaded(r)));
  }
}

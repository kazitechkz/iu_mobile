import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';

import '../../../domain/entities/attempt_entity.dart';
import '../../../domain/use_cases/get_attempt_by_promo_code_case.dart';

part 'attempt_by_promo_event.dart';
part 'attempt_by_promo_state.dart';

class AttemptByPromoBloc extends Bloc<AttemptByPromoEvent, AttemptByPromoState> {
  final GetAttemptByPromoCodeCase _getAttemptByPromoCodeCase;
  AttemptByPromoBloc({required GetAttemptByPromoCodeCase useCase}) :
        _getAttemptByPromoCodeCase = useCase, super(AttemptByPromoInitial()) {
    on<GetAttemptByPromoEvent>(_handleGetAttemptByPromo);
  }

  Future<void> _handleGetAttemptByPromo(GetAttemptByPromoEvent event, Emitter<AttemptByPromoState> emit) async {
    final result = await _getAttemptByPromoCodeCase(event.promo);
    result.fold(
            (l) => emit(AttemptByPromoFailure(FailureData.fromApiFailure(l))),
            (r) => emit(AttemptByPromoLoaded(r))
    );
  }
}

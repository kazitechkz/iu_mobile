import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/parameters/change_profile_parameters.dart';
import '../../../domain/use_cases/account_change_case.dart';

part 'change_user_info_event.dart';
part 'change_user_info_state.dart';

class ChangeUserInfoBloc extends Bloc<ChangeUserInfoEvent, ChangeUserInfoState> {
  final AccountChangeCase _accountChangeCase;
  ChangeUserInfoBloc({required AccountChangeCase accountChangeCase}) : _accountChangeCase = accountChangeCase, super(ChangeUserInfoInitial()) {
    on<ChangeEvent>(_handleChangeEvent);
  }

  Future<void> _handleChangeEvent(ChangeEvent event, Emitter<ChangeUserInfoState> emit) async {
    emit(ChangeUserInfoLoading());
    final result = await _accountChangeCase(event.params);
    result.fold((l) => emit(ChangeUserInfoError(FailureData(
        statusCode: l.statusCode, message: l.message, errors: l.errors))), (r) => emit(ChangeUserInfoLoaded(r)));
  }
}

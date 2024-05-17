import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/services/injection_main.container.dart';
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
    result.fold((l) {
        final failureData = FailureData.fromApiFailure(l);
        print(failureData.errors?.errors);
    emit(ChangeUserInfoError(failureData));},
            (r) => emit(ChangeUserInfoLoaded(r)));
  }
}

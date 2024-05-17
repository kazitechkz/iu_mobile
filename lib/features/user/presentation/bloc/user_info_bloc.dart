import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/common/models/failure_data.dart';
import '../../domain/entities/me_entity.dart';
import '../../domain/parameters/change_profile_parameters.dart';
import '../../domain/use_cases/account_case.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final AccountCase _accountCase;
  UserInfoBloc({required AccountCase accountCase}) : _accountCase = accountCase, super(UserInfoInitial()) {
    on<GetInfoEvent>(_handleGetInfo);
  }

  Future<void> _handleGetInfo(GetInfoEvent event, Emitter<UserInfoState> emit) async {
    emit(GetInfoLoading());
    final result = await _accountCase();
    result.fold((l) =>emit(GetInfoError(
        FailureData.fromApiFailure(l))), (r) => emit(GetInfoLoaded(r)));
  }
}

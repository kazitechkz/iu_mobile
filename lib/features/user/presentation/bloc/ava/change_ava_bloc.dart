import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/features/user/domain/parameters/change_profile_parameters.dart';
import 'package:iu/features/user/presentation/bloc/user_info_bloc.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/use_cases/change_ava_case.dart';

part 'change_ava_event.dart';
part 'change_ava_state.dart';

class ChangeAvaBloc extends Bloc<ChangeAvaEvent, ChangeAvaState> {
  final ChangeAvaCase _changeAvaCase;
  ChangeAvaBloc({required ChangeAvaCase useCase}) : _changeAvaCase = useCase, super(ChangeAvaInitial()) {
    on<AvaUploadEvent>(_handleChangeAva);
  }

  Future<void> _handleChangeAva(AvaUploadEvent event, Emitter<ChangeAvaState> emit) async {
    final userBloc = BlocProvider.of<UserInfoBloc>(event.context);
    emit(AvaUploading());
    ChangeAvatarParameter params = ChangeAvatarParameter(event.path);
    final result = await _changeAvaCase(params);
    result.fold((l) => emit(AvaUploadError(FailureData.fromApiFailure(l))), (r) {
      userBloc.add(const GetInfoEvent());
      emit(AvaUploaded());
    });
  }
}

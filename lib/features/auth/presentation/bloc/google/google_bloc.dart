import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/usecases/google_sign_in_case.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  final GoogleSignInCase _googleSignInCase;
  GoogleBloc({required GoogleSignInCase useCase}) : _googleSignInCase = useCase, super(GoogleInitial()) {
    on<GoogleSignInEvent>(_handleGoogleAuth);
    on<GoogleLoadingEvent>(_handleGoogleLoading);
    on<GoogleLoadingCanceledEvent>(_handleGoogleLoadingCanceled);
  }

  Future<void> _handleGoogleAuth(GoogleSignInEvent event, Emitter<GoogleState> emit) async {
    emit(GoogleLoading());
    final result = await _googleSignInCase(event.params);
    result.fold((l) => emit(GoogleError(FailureData.fromApiFailure(l))), (r) => emit(GoogleLoaded(r)));
  }

  Future<void> _handleGoogleLoading(GoogleLoadingEvent event, Emitter<GoogleState> emit) async {
    emit(GoogleLoading());
  }
  Future<void> _handleGoogleLoadingCanceled(GoogleLoadingCanceledEvent event, Emitter<GoogleState> emit) async {
    emit(GoogleLoadingCanceled());
  }
}

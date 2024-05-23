import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/usecases/kundelik_sign_in_case.dart';

part 'kundelik_event.dart';
part 'kundelik_state.dart';

class KundelikBloc extends Bloc<KundelikEvent, KundelikState> {
  final KundelikSignInCase _kundelikSignInCase;
  KundelikBloc({required KundelikSignInCase useCase}) : _kundelikSignInCase = useCase, super(KundelikInitial()) {
    on<KundelikLoadingEvent>(_handleKundelikLoading);
    on<KundelikAuthEvent>(_handleKundelikAuth);
    on<KundelikLoadingCanceledEvent>(_handleKundelikLoadingCanceled);
  }

  Future<void> _handleKundelikAuth(KundelikAuthEvent event, Emitter<KundelikState> emit) async {
    emit(KundelikLoading());
    final result = await _kundelikSignInCase(event.params);
    result.fold((l) => emit(KundelikError(FailureData.fromApiFailure(l))), (r) => emit(KundelikLoaded(r)));
  }

  Future<void> _handleKundelikLoading(KundelikLoadingEvent event, Emitter<KundelikState> emit) async {
    emit(KundelikLoading());
  }
  Future<void> _handleKundelikLoadingCanceled(KundelikLoadingCanceledEvent event, Emitter<KundelikState> emit) async {
    emit(KundelikLoadingCanceled());
  }
}

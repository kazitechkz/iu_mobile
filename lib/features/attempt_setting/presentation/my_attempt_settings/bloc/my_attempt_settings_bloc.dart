import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';
import '../../../../../core/common/models/pagination_data.dart';
import '../../../../../core/common/models/pagination_parameter.dart';
import '../../../domain/entities/attempt_setting_student_entity.dart';
import '../../../domain/entities/attempt_setting_unt_entity.dart';
import '../../../domain/use_cases/my_attempt_setting_single_use_case.dart';
import '../../../domain/use_cases/my_attempt_settings_unt_use_case.dart';
part 'my_attempt_settings_event.dart';
part 'my_attempt_settings_state.dart';

class MyAttemptSettingsSingleBloc
    extends Bloc<MyAttemptSettingsSingleEvent, MyAttemptSettingsSingleState> {
  MyAttemptSettingsSingleBloc(
      {required MyAttemptSettingSingleUseCase myAttemptSettingSingleUseCase})
      : _myAttemptSettingSingleUseCase = myAttemptSettingSingleUseCase,
        super(MyAttemptSettingsSingleInitialState()) {
    on<MyAttemptSettingsSingleGetEvent>(_handleMyAttemptSettingsSingleGetEvent);
  }

  final MyAttemptSettingSingleUseCase _myAttemptSettingSingleUseCase;

  Future<void> _handleMyAttemptSettingsSingleGetEvent(
      MyAttemptSettingsSingleGetEvent event,
      Emitter<MyAttemptSettingsSingleState> emit) async {
    if (state is MyAttemptSettingsSingleSuccessState) {
      final currentState = state as MyAttemptSettingsSingleSuccessState;
      emit(MyAttemptSettingsSingleLoadingState());
      final result = await _myAttemptSettingSingleUseCase(event.params);
      result.fold(
          (l) => emit(MyAttemptSettingsSingleFailureState(
              FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(
              SingleUntEntity: r,
              SingleUntData: [...currentState.singleUntData, ...r.data])));
    } else {
      emit(MyAttemptSettingsSingleLoadingState());
      final result = await _myAttemptSettingSingleUseCase(event.params);
      result.fold(
          (l) => emit(MyAttemptSettingsSingleFailureState(
              FailureData.fromApiFailure(l))),
          (r) => emit(MyAttemptSettingsSingleSuccessState(
              singleUntEntity: r, singleUntData: r.data)));
    }
  }
}

//Many

class MyAttemptSettingsManyBloc
    extends Bloc<MyAttemptSettingsManyEvent, MyAttemptSettingsManyState> {
  MyAttemptSettingsManyBloc(
      {required MyAttemptSettingsUntUseCase myAttemptSettingsUntUseCase})
      : this._myAttemptSettingsUntUseCase = myAttemptSettingsUntUseCase,
        super(MyAttemptSettingsManyInitialState()) {
    on<MyAttemptSettingsManyGetEvent>(_handleMyAttemptSettingsManyGetEvent);
  }

  final MyAttemptSettingsUntUseCase _myAttemptSettingsUntUseCase;

  Future<void> _handleMyAttemptSettingsManyGetEvent(
      MyAttemptSettingsManyGetEvent event,
      Emitter<MyAttemptSettingsManyState> emit) async {
    if (state is MyAttemptSettingsSingleSuccessState) {
      final currentState = state as MyAttemptSettingsManySuccessState;
      emit(MyAttemptSettingsManyLoadingState());
      final result = await _myAttemptSettingsUntUseCase(event.params);
      result.fold(
          (l) => emit(
              MyAttemptSettingsManyFailureState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(
              ManyUntEntity: r,
              ManyUntData: [...currentState.manyUntData, ...r.data])));
    } else {
      emit(MyAttemptSettingsManyLoadingState());
      final result = await _myAttemptSettingsUntUseCase(event.params);
      result.fold(
          (l) => emit(
              MyAttemptSettingsManyFailureState(FailureData.fromApiFailure(l))),
          (r) => emit(MyAttemptSettingsManySuccessState(
              manyUntEntity: r, manyUntData: r.data)));
    }
  }
}

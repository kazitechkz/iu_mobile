
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/pagination_data.dart';
import '../../../../../core/common/models/pagination_parameter.dart';
import '../../../domain/entities/attempt_setting_student_entity.dart';
import '../../../domain/entities/attempt_setting_unt_entity.dart';

part 'my_attempt_settings_event.dart';
part 'my_attempt_settings_state.dart';

class MyAttemptSettingsSingleBloc extends Bloc<MyAttemptSettingsSingleEvent, MyAttemptSettingsSingleState> {
  MyAttemptSettingsSingleBloc() : super(MyAttemptSettingsSingleInitialState()) {

  }
}



//Many

class MyAttemptSettingsManyBloc extends Bloc<MyAttemptSettingsSingleEvent, MyAttemptSettingsManyState> {
  MyAttemptSettingsManyBloc() : super(MyAttemptSettingsManyInitialState()) {

  }
}
part of 'my_attempt_settings_bloc.dart';

@immutable
abstract class MyAttemptSettingsSingleEvent {}

class MyAttemptSettingsSingleGetEvent extends MyAttemptSettingsSingleEvent{
  final PaginationParameter params;
  MyAttemptSettingsSingleGetEvent(this.params);
}


@immutable
abstract class MyAttemptSettingsManyEvent {}

class MyAttemptSettingsManyGetEvent extends MyAttemptSettingsManyEvent{
  final PaginationParameter params;
  MyAttemptSettingsManyGetEvent(this.params);
}
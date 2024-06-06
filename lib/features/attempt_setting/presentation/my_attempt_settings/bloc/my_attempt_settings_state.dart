part of 'my_attempt_settings_bloc.dart';

//Single

@immutable
abstract class MyAttemptSettingsSingleState extends Equatable {}

class MyAttemptSettingsSingleInitialState extends MyAttemptSettingsSingleState {
  @override
  List<Object?> get props => [];
}

class MyAttemptSettingsSingleLoadingState extends MyAttemptSettingsSingleState {
  @override
  List<Object?> get props => [];
}
class MyAttemptSettingsSingleFailureState extends MyAttemptSettingsSingleState {
  final FailureData failureData;
  MyAttemptSettingsSingleFailureState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

class MyAttemptSettingsSingleSuccessState extends MyAttemptSettingsSingleState {
  final PaginationData<List<AttemptSettingStudentEntity>> singleUntEntity;
  final List<AttemptSettingStudentEntity> singleUntData;
  MyAttemptSettingsSingleSuccessState({required this.singleUntEntity, required this.singleUntData});

  MyAttemptSettingsSingleSuccessState copyWith({
    PaginationData<List<AttemptSettingStudentEntity>>? SingleUntEntity,
    List<AttemptSettingStudentEntity>? SingleUntData,
}){
    return MyAttemptSettingsSingleSuccessState(singleUntEntity: SingleUntEntity ?? singleUntEntity, singleUntData: SingleUntData ?? singleUntData);
  }

  @override
  List<Object?> get props => [singleUntEntity,singleUntData];
}

//Many

@immutable
abstract class MyAttemptSettingsManyState extends Equatable {}

class MyAttemptSettingsManyInitialState extends MyAttemptSettingsManyState {
  @override
  List<Object?> get props => [];
}

class MyAttemptSettingsManyLoadingState extends MyAttemptSettingsManyState {
  @override
  List<Object?> get props => [];
}
class MyAttemptSettingsManyFailureState extends MyAttemptSettingsManyState {
  final FailureData failureData;
  MyAttemptSettingsManyFailureState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

class MyAttemptSettingsManySuccessState extends MyAttemptSettingsManyState {
  final PaginationData<List<AttemptSettingUntEntity>> manyUntEntity;
  final List<AttemptSettingUntEntity> manyUntData;
  MyAttemptSettingsManySuccessState({required this.manyUntEntity, required this.manyUntData});


  MyAttemptSettingsManySuccessState copyWith({
    PaginationData<List<AttemptSettingUntEntity>>? ManyUntEntity,
    List<AttemptSettingUntEntity>? ManyUntData,
  }){
    return MyAttemptSettingsManySuccessState(manyUntEntity: ManyUntEntity ?? manyUntEntity, manyUntData: ManyUntData ?? manyUntData);
  }

  @override
  List<Object?> get props => [manyUntData,manyUntEntity];
}
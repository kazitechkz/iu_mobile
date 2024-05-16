part of 'change_user_info_bloc.dart';

sealed class ChangeUserInfoState extends Equatable {
  const ChangeUserInfoState();
}

final class ChangeUserInfoInitial extends ChangeUserInfoState {
  @override
  List<Object> get props => [];
}

final class ChangeUserInfoLoading extends ChangeUserInfoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ChangeUserInfoLoaded extends ChangeUserInfoState {
  final bool result;
  const ChangeUserInfoLoaded(this.result);
  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

final class ChangeUserInfoError extends ChangeUserInfoState {
  final FailureData failureData;
  const ChangeUserInfoError(this.failureData);
  @override
  List<Object> get props => [failureData];
}

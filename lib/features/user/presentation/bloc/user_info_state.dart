part of 'user_info_bloc.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();
}

final class UserInfoInitial extends UserInfoState {
  @override
  List<Object> get props => [];
}

final class GetInfoLoading extends UserInfoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GetInfoLoaded extends UserInfoState {
  final MeEntity meInfo;
  const GetInfoLoaded(this.meInfo);
  @override
  // TODO: implement props
  List<Object?> get props => [meInfo];
}

final class GetInfoError extends UserInfoState {
  final FailureData failureData;
  const GetInfoError(this.failureData);
  @override
  List<Object> get props => [failureData];
}
part of 'user_info_bloc.dart';

sealed class UserInfoEvent extends Equatable {
  const UserInfoEvent();
}

class GetInfoEvent extends UserInfoEvent {
  const GetInfoEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
part of 'change_user_info_bloc.dart';

sealed class ChangeUserInfoEvent extends Equatable {
  const ChangeUserInfoEvent();
}

class ChangeEvent extends ChangeUserInfoEvent {
  final ChangeProfileParameter params;
  const ChangeEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}
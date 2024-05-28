part of 'init_pay_bloc.dart';

sealed class InitPayEvent extends Equatable {
  const InitPayEvent();
}

class GetInitPayResultEvent extends InitPayEvent {
  final PayBoxRequest params;
  const GetInitPayResultEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}

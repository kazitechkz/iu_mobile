part of 'init_pay_bloc.dart';

sealed class InitPayState extends Equatable {
  const InitPayState();
}

final class InitPayInitial extends InitPayState {
  @override
  List<Object> get props => [];
}

class GetInitPayLoading extends InitPayState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetInitPayResultLoaded extends InitPayState {
  final PayBoxEntity payBoxEntity;
  const GetInitPayResultLoaded(this.payBoxEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [payBoxEntity];
}

class GetInitPayResultError extends InitPayState {
  final FailureData failureData;
  const GetInitPayResultError(this.failureData);
  @override
  List<Object> get props => [failureData];
}
